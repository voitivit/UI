//
//  FriendsPhotoVC.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 18.05.2021.
//

import UIKit
class FriendsPhotoVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(recognizer)
        PhotoFriends.image = allPhotos[countCurentPhoto]
    }
    
    @IBOutlet weak var PhotoFriends: UIImageView!
    
    var allPhotos:[UIImage?] = []
    var countCurentPhoto = 0
    
    // MARK: - Animator
    var interactiveAnimator: UIViewPropertyAnimator!
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            interactiveAnimator?.startAnimation()
            interactiveAnimator = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    self.PhotoFriends.alpha = 0.5
                    self.PhotoFriends.transform = .init(scaleX: 1.5, y: 1.5)
                })
            interactiveAnimator.pauseAnimation()
            
        case .changed:
            let translation = recognizer.translation(in: self.view)
            interactiveAnimator.fractionComplete = abs(translation.x / 100)
            self.PhotoFriends.transform = CGAffineTransform(translationX: translation.x, y: 0)
            
        case .ended:
            interactiveAnimator.stopAnimation(true)
            if recognizer.translation(in: self.view).x < 0 {
                if  countCurentPhoto < allPhotos.count - 1  {
                    self.countCurentPhoto += 1
                }
            } else {
                if countCurentPhoto != 0 {  
                    self.countCurentPhoto -= 1
                }
            }
            interactiveAnimator.addAnimations {
                self.PhotoFriends.transform = .identity
                self.PhotoFriends.alpha = 1
            }
            interactiveAnimator?.startAnimation()
            
        default: break
        }
        PhotoFriends.image = allPhotos[countCurentPhoto]
        
    }
}


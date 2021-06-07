//
//  CustomNavigationController.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 24.05.2021.
//

import UIKit
class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    let animatorPop = PopAnimator()
    let animatorPush = PushAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    
    
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            
            self.interactiveTransition.viewController = toVC
            
            return animatorPush
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return animatorPop
        }
        return nil
    }
    
    
    let interactiveTransition = CustomInteractiveTransition()
    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
}



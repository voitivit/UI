//
//  FriendsPhotoCollectionVC.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit
class FriendsPhotoCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var nameImageFriends: [UIImage?] = []
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return nameImageFriends.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: friendsPhotoCollectionVCell.reuseID, for: indexPath) as! friendsPhotoCollectionVCell
        cell.friendsPhotoImage.image = nameImageFriends[indexPath.row]
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showUserPhoto"{
            
            guard let photosFriend = segue.destination as? FriendsPhotoVC else { return }
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                photosFriend.allPhotos = nameImageFriends
                photosFriend.countCurentPhoto = indexPath.row
            }
        }
    }
}

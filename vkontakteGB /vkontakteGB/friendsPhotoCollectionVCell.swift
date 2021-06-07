//
//  friendsPhotoCollectionVCell.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit

class friendsPhotoCollectionVCell: UICollectionViewCell {
    
    static let reuseID = "friendsPhotoCollectionVCell"
    @IBOutlet weak var friendsPhotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(image: UIImage?) {
      
        friendsPhotoImage.image = image
    }
    
    
}

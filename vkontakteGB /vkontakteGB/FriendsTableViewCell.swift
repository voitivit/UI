//
//  FriendsTableViewCell.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    static let reuseID = "FriendsTableViewCell"
    @IBOutlet weak var labelViewCell: UILabel!
    @IBOutlet weak var imageViewCell: AvatarsView!
    
    
    func configure (title: String?, image: UIImage?) {
        labelViewCell.text = title
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
}

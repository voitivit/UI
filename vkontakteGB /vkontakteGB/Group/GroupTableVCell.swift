//
//  GroupTableVCell.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit

class GroupTableVCell: UITableViewCell {
    static let reuseID = "GroupTableVCell"
    
    @IBOutlet weak var labelGroup: UILabel!
    @IBOutlet weak var imageGroup: AvatarsView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

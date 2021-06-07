//
//  TableNewsVCell.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 12.05.2021.
//

import UIKit
class TableNewsVCell: UITableViewCell {
   static let reuseID = "NewsCell"
    @IBOutlet weak var avatarNews: AvatarsView!
    @IBOutlet weak var nameUserNews: UILabel!
    @IBOutlet weak var dataNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    
}

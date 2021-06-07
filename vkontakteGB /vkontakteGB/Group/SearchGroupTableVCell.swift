//
//  SearchGroupTableVCell.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit

class SearchGroupTableVCell: UITableViewCell {
    static let reuseID = "SearchGroupTableVCell"
    
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchImage: AvatarsView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

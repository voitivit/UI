//
//  ModelGroup.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 12.05.2021.
//

import UIKit

struct Group: Equatable{
    let groupName: String
    let groupLogo: UIImage?
    
    static func ==(lhs: Group, rhs: Group) -> Bool {
        return lhs.groupName == rhs.groupName 
    }
    
}


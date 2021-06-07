//
//  SearchGroupTableVC.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit

class SearchGroupTableVC: UITableViewController {
    var allGroups = [
        Group(groupName: "Самая лучшая группа", groupLogo: UIImage(named: "swift3")),
        Group(groupName: "MATLAB", groupLogo: UIImage(named: "Matlab2")),
        Group(groupName: "Все о змеях", groupLogo: UIImage(named: "python1")),
        Group(groupName: "Еще Свифта", groupLogo: UIImage(named: "swift1")),
        Group(groupName: "Все о бэйсике)", groupLogo: UIImage(named: "VisualBasic"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchGroupTableVCell.reuseID, for: indexPath) as! SearchGroupTableVCell
        
        cell.searchLabel.text = allGroups[indexPath.row].groupName
        cell.searchImage.avatarImage.image = allGroups[indexPath.row].groupLogo
        
        
        return cell
    }
}

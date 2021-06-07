//
//  GroupTableVC.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit

class GroupTableVC: UITableViewController {
    var groups = [Group(groupName: "Группа Swift", groupLogo: UIImage(named: "swift1"))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableVCell.reuseID, for: indexPath) as!  GroupTableVCell
        cell.labelGroup.text = groups[indexPath.row].groupName
        
        let avatar = groups[indexPath.row].groupLogo 
        cell.imageGroup.avatarImage.image = avatar
        
        return cell
        
        
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addGroup (segue: UIStoryboardSegue) {
        
        if segue.identifier == "AddGroup"{
            guard let newGroupFromController = segue.source as? SearchGroupTableVC else { return }
            if let indexPath = newGroupFromController.tableView.indexPathForSelectedRow {
                let newGroup = newGroupFromController.allGroups[indexPath.row]
                guard !groups.contains(newGroup) else { return }
                groups.append(newGroup)
                
                tableView.reloadData()
            }
        }
    }
}













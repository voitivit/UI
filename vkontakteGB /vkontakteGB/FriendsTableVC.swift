//
//  FriendsTableVC.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 28.04.2021.
//

import UIKit

class FriendsTableVC: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let friendsList = [
        User(userName: "Swift",
             userAvatar: (UIImage(named: "swift2")),
             userPhotos: [UIImage(named: "swift1"), UIImage(named: "swift2"), UIImage(named: "swift2")]),
        User(userName: "Python",
             userAvatar: (UIImage(named: "python2")),
             userPhotos: [UIImage(named: "python1"), UIImage(named: "python2"), UIImage(named: "python3")]),
        User(userName: "C#",
             userAvatar: (UIImage(named: "C#2")),
             userPhotos: [UIImage(named: "C#2")]),
        User(userName: "C++",
             userAvatar: (UIImage(named: "C++2")),
             userPhotos: [UIImage(named: "C++1"), UIImage(named: "C++2")]),
        User(userName: "Java",
             userAvatar: (UIImage(named: "java2")),
             userPhotos: [UIImage(named: "java1"), UIImage(named: "java2"), UIImage(named: "java3"), UIImage(named: "java4")]),
        User(userName: "Java Script",
             userAvatar: (UIImage(named: "JS")),
             userPhotos: [UIImage(named: "JS")]),
        User(userName: "Ruby",
             userAvatar: (UIImage(named: "Ruby2")),
             userPhotos: [UIImage(named: "Ruby1"), UIImage(named: "Ruby2")]),
        User(userName: "VisualBasic",
             userAvatar: (UIImage(named: "VisualBasic")),
             userPhotos: [UIImage(named: "VisualBasic")]),
        User(userName: "Objective-C",
             userAvatar: (UIImage(named: "OBJC")),
             userPhotos: [UIImage(named: "OBJC")]),
        User(userName: "MATLAB",
             userAvatar: (UIImage(named: "Matlab2")),
             userPhotos: [UIImage(named: "Matlab1"), UIImage(named: "Matlab2")]),
        User(userName: "Perl",
             userAvatar: (UIImage(named: "Perl1")),
             userPhotos: [UIImage(named: "Perl1")]),
        User(userName: "PHP",
             userAvatar: (UIImage(named: "PHP1")),
             userPhotos: [UIImage(named: "PHP1"), UIImage(named: "PHP2"), UIImage(named: "PHP3")]),
        User(userName: "SQL",
             userAvatar: (UIImage(named: "SQL1")),
             userPhotos: [UIImage(named: "SQL1"), UIImage(named: "SQL2")]),
        User(userName: "HTML",
             userAvatar: (UIImage(named: "HTML1")),
             userPhotos: [UIImage(named: "HTML1"), UIImage(named: "HTML2"), UIImage(named: "HTML3")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        makeNamesList()
        sortCharacterOfNamesAlphabet()
    }
    
    var namesListFixed: [String] = []
    var namesListModifed: [String] = []
    var letersOfNames: [String] = []
    
    
    // MARK: - functions
    
 
    func makeNamesList() {
        namesListFixed.removeAll()
        for item in 0...(friendsList.count - 1){
            namesListFixed.append(friendsList[item].userName)
        }
        namesListModifed = namesListFixed
    }
    
   
    func sortCharacterOfNamesAlphabet() {
        var letersSet = Set<Character>()
        letersOfNames = []
       
        for name in namesListModifed {
            letersSet.insert(name[name.startIndex])
        }
       
        for leter in letersSet.sorted() {
            letersOfNames.append(String(leter))
        }
    }
    
    func getNameFriendForCell(_ indexPath: IndexPath) -> String {
        var namesRows = [String]()
        for name in namesListModifed.sorted() {
            if letersOfNames[indexPath.section].contains(name.first!) {
                namesRows.append(name)
            }
        }
        return namesRows[indexPath.row]
    }
    
    func getAvatarFriendForCell(_ indexPath: IndexPath) -> UIImage? {
        for friend in friendsList {
            let namesRows = getNameFriendForCell(indexPath)
            if friend.userName.contains(namesRows) {
                return friend.userAvatar
            }
        }
        return nil
    }
    
    func getPhotosFriend(_ indexPath: IndexPath) -> [UIImage?] {
        var photos = [UIImage?]()
        for friend in friendsList {
            let namesRows = getNameFriendForCell(indexPath)
            if friend.userName.contains(namesRows) {
                photos.append(contentsOf: friend.userPhotos)
               
            }
        }
        return photos
    }
    
    
    // MARK: - searchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        namesListModifed = searchText.isEmpty ? namesListFixed : namesListFixed.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        sortCharacterOfNamesAlphabet()
        tableView.reloadData()
    }
    
   
    // MARK: - Table view
    
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return letersOfNames.count
    }
    
   
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let leter: UILabel = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        leter.textColor = UIColor.black.withAlphaComponent(0.5)
        leter.text = letersOfNames[section]
        leter.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        header.addSubview(leter)
        
        return header
    }
   
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return letersOfNames
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = 0
    
        for name in namesListModifed {
            if letersOfNames[section].contains(name.first!) {
                countOfRows += 1
            }
        }
        return countOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
       
        cell.labelViewCell.text = getNameFriendForCell(indexPath)
        cell.imageViewCell.avatarImage.image = getAvatarFriendForCell(indexPath)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendsPhotoSegue"{
           
            guard let photosFriend = segue.destination as? FriendsPhotoCollectionVC else { return }
            
           
            if let indexPath = tableView.indexPathForSelectedRow {
                photosFriend.title = getNameFriendForCell(indexPath) 
                photosFriend.nameImageFriends = getPhotosFriend(indexPath) 
                
            }
        }
    }
    
}

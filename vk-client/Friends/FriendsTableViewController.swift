//
//  FriendsTableViewController.swift
//  vk-client
//
//  Created by i.vasilyev on 19.02.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    var friendList = [
        User(name:"Sharik",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Bobick",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Barbos",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Fabien",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Fannya",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Gabriella",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Garfield",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Gizzy",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Gloria",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Gracie",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Grand",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Gizmo",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Henrietta",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Harold",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Happy",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Henrietta",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Hickory",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Hillary",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Holmes",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Onyx",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Opal",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Ormando",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Osman",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Pippin",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
        User(name:"Ponka",avatar:UIImage(named: "Sharik"),arrayImages: [(UIImage(named: "sharik11"),5),(UIImage(named: "sharik12"),3),]),
        User(name:"Pricilla",avatar:UIImage(named: "Bobick"),arrayImages: [(UIImage(named: "bobik11"),10),(UIImage(named: "bobik12"),8),]),
        User(name:"Princess",avatar:UIImage(named: "Barbos"),arrayImages: [(UIImage(named: "barbos11"),7),(UIImage(named: "barbos12"),6),]),
    ]
    
    var arrayFirstChar: [Character] {
    
        var currentArray:[Character] = []
        friendList.sort(by: {$0.name<$1.name})
        friendList.forEach { (User) in
            if !currentArray.contains(User.name.first!)
            {
                currentArray.append(User.name.first!)
            }
        }
        return currentArray
    }
    
    var ferstLeterAndFriendsArray: [FriendSection] {
    
        var arrayOfArrays:[FriendSection]  = []
        var currentArray: [User] = []
        if friendList.count == 0 {
            return []
        }
        guard var currentChacakter = friendList[0].name.first else {return []}
        friendList.sort(by: {$0.name<$1.name})
        friendList.forEach { (User) in
            if currentChacakter != User.name.first! {
                arrayOfArrays.append(FriendSection(title: currentChacakter, arrayUser: currentArray))
                currentChacakter = User.name.first!
                currentArray = []
                currentArray.append(User)
            } else {
                currentArray.append(User)
            }
        }
        arrayOfArrays.append(FriendSection(title: currentChacakter, arrayUser: currentArray))
        return arrayOfArrays
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FriendListLetter.self, forHeaderFooterViewReuseIdentifier: FriendListLetter.reuseUIdentifier)

        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrayFirstChar.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ferstLeterAndFriendsArray[section].arrayUser.count
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendListLetter.reuseUIdentifier) as? FriendListLetter else {return nil}
        let ferstLeter = String(ferstLeterAndFriendsArray[section].title)
        header.headerTitle.text = ferstLeter
        return header
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriend", for: indexPath) as? FriendCell else {return UITableViewCell()}

        cell.friendLable.text = ferstLeterAndFriendsArray[indexPath.section].arrayUser[indexPath.row]?.name
        cell.friendAvatar.image = ferstLeterAndFriendsArray[indexPath.section].arrayUser[indexPath.row]?.avatar

        return cell
    }
   
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return String(ferstLeterAndFriendsArray[section].title)
//    }
  

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if segue.identifier == "ShowFriendImages",
          let senderCell = sender as? FriendCell,
          let cellIndexPath = tableView.indexPath(for: senderCell),
          let imageCollectionVievController = segue.destination as? ImagesCollectionViewController {
          let selectedFriend = friendList[cellIndexPath.row]
        imageCollectionVievController.userName = selectedFriend.name
        imageCollectionVievController.userImages = selectedFriend.arrayImages
       }
        
    }


}

//
//  AddGroupViewController.swift
//  vk-client
//
//  Created by i.vasilyev on 22.02.2021.
//

import UIKit

class AddGroupViewController: UITableViewController {

     let addGroupList = [
        Group(name:"Best Day",avatar:UIImage(named: "BestDay")),
        Group(name:"Dog Star",avatar:UIImage(named: "DogStar")),
        Group(name:"let's be sad",avatar:UIImage(named: "let's be sad")),
        Group(name:"Dog Chimpanzee Nodozavr",avatar:UIImage(named: "nice walk")),
        Group(name:"Dog structure brahiozavr",avatar:UIImage(named: "smile dog")),
        Group(name:"Dog recent artroplevra",avatar:UIImage(named: "GoodBoy")),
        Group(name:"Task letuchaya ryba",avatar:UIImage(named: "nice walk")),
        Group(name:"Help mister mxyzptlk",avatar:UIImage(named: "smile dog")),
        Group(name:"Magazine usagi yodzhimbo",avatar:UIImage(named: "GoodBoy")),
        Group(name:"Dangerous henk pim",avatar:UIImage(named: "nice walk")),
        Group(name:"Chicken chelovek-yastreb",avatar:UIImage(named: "smile dog")),
        Group(name:"Sea gorilla grodd",avatar:UIImage(named: "GoodBoy")),
        Group(name:"It's time yashcer",avatar:UIImage(named: "nice walk")),
        Group(name:"Remarkable kang zavoevatel",avatar:UIImage(named: "smile dog")),
        Group(name:"Dirty mishoni",avatar:UIImage(named: "GoodBoy")),
        Group(name:"Hamster sorvigolova",avatar:UIImage(named: "nice walk")),
        Group(name:"Interest ingolv",avatar:UIImage(named: "smile dog")),
        Group(name:"Dangerous holmsteyn",avatar:UIImage(named: "GoodBoy")),
        Group(name:"Dog lion isi",avatar:UIImage(named: "nice walk")),
        Group(name:"Camel verlliann",avatar:UIImage(named: "smile dog")),
        Group(name:"Attentive yanvi",avatar:UIImage(named: "GoodBoy")),
    ]
    var groupInfo:Group?
    private var filtretGroups: [Group] = []
    let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isfiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    var currentArray: [Group] {
        if isfiltering {
            return filtretGroups
        } else {
            return addGroupList
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isfiltering {
            return filtretGroups.count
        }
        return addGroupList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddGroupCellID", for: indexPath)
                as? AddGroupViewCell else { return UITableViewCell()
            
        }
        var currentItem: Group
        if isfiltering {
            currentItem = filtretGroups[indexPath.row]
        } else {
            currentItem = addGroupList[indexPath.row]
        }
        
        cell.addGroupLabel.text = currentItem.name
        cell.addGroupAvatar.image = currentItem.avatar


        return cell
    }
    
}

extension AddGroupViewController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filtretGroups = addGroupList.filter({(group: Group) -> Bool in
            return group.name.lowercased().contains(searchText.lowercased())
            
    })
        tableView.reloadData()
   }
}

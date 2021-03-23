//
//  GroupsTableViewController.swift
//  vk-client
//
//  Created by i.vasilyev on 19.02.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {

   
     var groupList = [
        Group(name:"Nice walk",avatar:UIImage(named: "nice walk")),
        Group(name:"Smile dog",avatar:UIImage(named: "smile dog")),
        Group(name:"Good Boy",avatar:UIImage(named: "GoodBoy")),

    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

            return groupList.count
            
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
                as? GroupCell else {
            return UITableViewCell()
        }

        let currentItem = groupList[indexPath.row]
             
        
        cell.groupLabel.text = currentItem.name
        cell.groupAvatar.image = currentItem.avatar

        // Configure the cell...
        return cell
    }

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if let addGroupVievController = segue.source as? AddGroupViewController,
            let selectedIndexPath = addGroupVievController.tableView.indexPathForSelectedRow{
                let selectedGroup = addGroupVievController.currentArray[selectedIndexPath.row]        
            
            if !groupList.contains(selectedGroup) {
                groupList.append(selectedGroup)
            tableView.reloadData()
            }
           
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            groupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}





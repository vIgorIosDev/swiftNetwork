//
//  NewsTableViewcTableViewController.swift
//  vk-client
//
//  Created by i.vasilyev on 06.03.2021.
//

import UIKit

class NewsTableViewcTableViewController: UITableViewController {
    
    let newsList = [
        News(title: "Котомедузы и уткошары: зверей с неудачных фото воссоздали в реальности",
             imageArray: [UIImage(named: "news_1"),UIImage(named: "news_2"),],
             description: "Если вам нравятся животные и мемы, то, скорее всего, вы слышали о популярном японском художнике и скульптуре, известном в сети под ником Meetissai. Если нет, то поздравляем — наступил ваш счастливый день.", likes: "15", numberOfVievs: "50"),
        News(title: "Клички для собак-мальчиков немецких овчарок",
             imageArray: [UIImage(named: "news_2"),UIImage(named: "news_2")], description: "Немецкие овчарки — невероятно преданные и умные собаки. Они могут стать любимыми членами семьи, а могут «устроиться» на настоящую работу в полицию, армию, МЧС или стать собаками-поводырями.", likes: "10", numberOfVievs: "70"),
        News(title: "Ученые: кошки не понимают, когда к хозяину кто-то плохо относится",
             imageArray: [UIImage(named: "news_3"),UIImage(named: "news_2")], description: "Кошка согласна взять угощение у человека, отказавшего хозяину в помощи, установили японские ученые. Дело, однако, не в кошачьем эгоизме и равнодушии к хозяину — кошки просто не понимают тонкостей взаимодействия между людьми.", likes: "14", numberOfVievs: "55"),
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsList.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {return UITableViewCell()}

        cell.newsTitle.text = newsList[indexPath.row].title
        cell.newsImage.image = newsList[indexPath.row].imageArray[0]
        cell.newsLikeCount.text = newsList[indexPath.row].likes
        cell.newsCommentLable.text = "0"
        cell.newsViewLable.text = newsList[indexPath.row].numberOfVievs
        
 //       cell.newsDescription.text = newsList[indexPath.row].description
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

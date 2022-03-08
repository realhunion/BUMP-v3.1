//
//  InfoVC.swift
//  Bump
//
//  Created by Hunain Ali on 11/25/20.
//

import UIKit

class InfoVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "i1")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        }
        if section == 1 {
            return 4
        }else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
//            return "How it Works"
            return nil
        }
        if section == 1 {
            return "Points"
        }else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "i1", for: indexPath)

        // Configure the cell...
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
//                cell.textLabel?.text = "1. Join your Clubs."
                cell.textLabel?.text = "Score:"
                cell.detailTextLabel?.text = "Average points per chat"
            }
            if indexPath.row == 1 {
                cell.textLabel?.text = nil
                cell.detailTextLabel?.text = "People with similar scores get matched together."
            }
            
        }
        if indexPath.section == 1 {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
            cell.textLabel?.textColor = .label
            if indexPath.row == 0 {
                cell.textLabel?.text = "+1 Msg Sent"
            }
            if indexPath.row == 1 {
                cell.textLabel?.text = "+5 Msg Received"
            }
            if indexPath.row == 2 {
                cell.textLabel?.text = "+10 First to Send Msg"
            }
            if indexPath.row == 3 {
                cell.textLabel?.text = "+20 Mystery Metric"
            }
            if indexPath.row == 5 {
                cell.textLabel?.font = UIFont.systemFont(ofSize: 16.0)
                cell.textLabel?.textColor = .label
                cell.textLabel?.text = "→AI matches together people with higher scores."
            }
            
        }
        
        cell.textLabel?.numberOfLines = 99

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

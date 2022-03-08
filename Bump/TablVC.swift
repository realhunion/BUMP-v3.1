//
//  TablVC.swift
//  Bump
//
//  Created by Hunain Ali on 11/15/20.
//

import UIKit

class TableVC: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "c4534")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 27
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "c4534", for: indexPath)
        cell.accessoryType = .none
        
        
        
        cell.textLabel?.text = "\(Constant.getNames().randomElement()!) bumped into \(Constant.getNames().randomElement()!)"
        cell.imageView?.image = Constant.imageWith(name: "\(randomEmoji())")
        
        if indexPath.row == 15 {
            cell.textLabel?.text = "\(Constant.getNames().randomElement()!) bumped into Hunain"
            cell.imageView?.image = Constant.imageWith(name: "😈")
//            cell.accessoryType = .checkmark
        }
        if indexPath.row == 5 {
            cell.textLabel?.text = "Hunain bumpted into \(Constant.getNames().randomElement()!)"
            let emojis2 = ["🌱","💯","🤯","🥾","🍃","🥑","🤡"]
            cell.imageView?.image = Constant.imageWith(name: "\(emojis2.randomElement()!)")
//            cell.accessoryType = .disclosureIndicator
        }
        
        if indexPath.row == 12 {
            cell.textLabel?.text = "James bumped into \(Constant.getNames().randomElement()!)"
            let emojis3 = ["🔥"]
            cell.imageView?.image = Constant.imageWith(name: "\(emojis3.randomElement()!)")
        }
        
        cell.textLabel?.textColor = .label
        cell.detailTextLabel?.text = "\(Int.random(in: 1...60)) min ago"
        cell.detailTextLabel?.textColor = .secondaryLabel
        
        cell.selectionStyle = .none
        return cell
    }
    
    func randomEmoji() -> String {
        let names = ["😀","😁","😂","😃","😄","😅","😆","😇","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷","😸","😹","😺","😻","😼","👻","👺","💩","💀","👽","👾","🙌","🙌🏻","🙌🏼","🙌🏽","👀","💋","👅","👎","👎🏻","👎🏼","👌🏼","👌🏽","👌🏾","💪","💪🏻","👐","🙏","🙏🏻","🙏🏿","🌱","🌲","🌳","🌴","🌵","🌷","🌸","🌹","🌺","🌻","🌼","💐","🌾","🌿","🍀","🍁","🍂","🍃","🔥","🔥","🔥","🔥","🔥","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","👍","😍","😍","😍","😍"]

        return names.randomElement()!
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

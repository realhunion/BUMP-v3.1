//
//  EmojiPickerVC.swift
//  Bump
//
//  Created by Hunain Ali on 11/17/20.
//

import UIKit

class EmojiPickerVC: UITableViewController {

    var emojiArray = ["👍","👎","😀","😁","😂","😃","😄","😅","😆","😇","😈","👿","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷"]
    
    var chatID : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let prefs = UserDefaults(suiteName: "com.apple.EmojiPreferences"){
//            if let defaults = prefs.dictionary(forKey: "EMFDefaultsKey"){
//                if let recents = defaults["EMFRecentsKey"] as? [String]{
//                    self.emojiArray.append(contentsOf: recents)
//                }
//            }
//        }
        

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "c01")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.emojiArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "c01", for: indexPath)
        
//        if indexPath.row == 0 {
//            let switchView = UISwitch(frame: .zero)
//            switchView.setOn(false, animated: true)
//            switchView.tag = indexPath.row // for detect which row switch Changed
//            switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
//            cell.accessoryView = switchView
//            cell.textLabel?.text = "Would chat again:"
//            cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
//            cell.textLabel?.textColor = .systemGray
//            cell.textLabel?.numberOfLines = 99
//            cell.textLabel?.textAlignment = .left
//
//            return cell
//        }

        // Configure the cell...
        cell.textLabel?.text = self.emojiArray[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 32)
        cell.textLabel?.textAlignment = .center
        cell.accessoryView = nil
        

        return cell
    }
    
    @objc func switchChanged(_ sender : UISwitch!){

          print("table row switch Changed \(sender.tag)")
          print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let pVC = self.presentingViewController as? HomeTabBarVC {
            pVC.vc1.deleteRow(chatID: self.chatID)
        }
        self.dismiss(animated: true, completion: nil)
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

//
//  ClubsVC.swift
//  Bump
//
//  Created by Hunain Ali on 11/26/20.
//

import UIKit
import FirebaseFirestore

class ClubsVC: UITableViewController {
    
    var clubsFetcher : ClubsFetcher?
    var clubArray : [Club] = []
    
    override init(style: UITableView.Style) {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "c21")
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "c22")
        
//        self.setupClubsFetcher()
        self.clubArray = Constant.getClubs()
        //FIX: this
    }
    
    func shutDown() {
        clubsFetcher?.shutDown()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.clubArray.count + 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 0
        }else {
            return 2
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "c21", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Create"
            cell.textLabel?.textColor = .label
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            cell.backgroundColor = UIColor.secondarySystemGroupedBackground
            
        } else {
            
            let club = self.clubArray[indexPath.section-1]
            
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: "c22", for: indexPath)
                
                cell.textLabel?.text = club.name
                cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
                cell.textLabel?.textColor = .label
                var detailText = "→ \(Int.random(in: 10...80)) Members\n"
                cell.detailTextLabel?.text = detailText + club.description
                
                cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
                cell.detailTextLabel?.textColor = UIColor.secondaryLabel
                cell.detailTextLabel?.numberOfLines = 6
                cell.backgroundColor = UIColor.secondarySystemGroupedBackground
                
            }
            if indexPath.row == 1 {
                if club.isJoined() {
                    cell.textLabel?.text = "J✓ - Bumps Tue.Sat.12pm"
                } else {
                    cell.textLabel?.text = "JOIN"
                }
                cell.textLabel?.textColor = .black
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .heavy)
                cell.backgroundColor = Constant.oNeon
            }
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            self.createButtonTapped()
        } else {
            let club = self.clubArray[indexPath.section - 1]
            self.joinButtonTapped(club: club)
        }
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

//
//  MyChatsVC.swift
//  Bump
//
//  Created by Hunain Ali on 11/15/20.
//

import UIKit
import FirebaseFirestore

class MyChatsVC: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    var myChatArray : [MyChat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "c3")
        
        for _ in 1...2 {
            self.addRandomChat()
        }
    }
    
    func addRandomChat() {
        var ar : [MetaUser] = []
        for _ in 1...Int.random(in: 2...2) {
            let m = MetaUser(userID: "\(Int.random(in: 0...45243))", name: Constant.getNames().randomElement()!, lastUpdated: Timestamp(date: Date()))
            ar.append(m)
        }
        let myChat = MyChat(chatID: "\(Int.random(in: 0...12345))", clubName: Constant.getClubs().randomElement()!.name, userArray: ar)
        self.myChatArray.append(myChat)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }
        else {
            return self.myChatArray.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "c3", for: indexPath)
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "Tip 1:"
                cell.detailTextLabel?.text = "Move up the divisions."
                cell.detailTextLabel?.numberOfLines = 10
                cell.accessoryType = .none
            }

            return cell
        }

        var img = UIImage(color: UIColor.systemBlue, size: CGSize(width: 5, height: 5))
        if indexPath.row == 0 || indexPath.row == 0 {
            img = UIImage(color: UIColor.systemYellow, size: CGSize(width: 5, height: 5))
        }

        cell.imageView?.image = img
        cell.imageView?.layer.cornerRadius = 5
        cell.imageView?.clipsToBounds = true
        
        let c = self.myChatArray[indexPath.row]
        cell.textLabel?.numberOfLines = 99
        
        cell.textLabel?.text = c.getChatName()
        cell.textLabel?.textColor = .label
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        let availableTiles = ["A", "B", "C", "D", "E", "F","G","H"]
        cell.detailTextLabel?.text = Constant.getClubs().randomElement()!.name + " · Division \(Int.random(in: 1...8))"
        cell.detailTextLabel?.textColor = .secondaryLabel
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
//        if indexPath.row == 2 {
//            cell.textLabel?.text = "Grant, Jeni, and You"
//        }
        
        cell.accessoryType = .disclosureIndicator
    
        
        return cell
    }
    
    func deleteRow(chatID : String) {

        guard let index = self.myChatArray.firstIndex(where: {$0.chatID == chatID}) else { return }
        print("trubisky 0")
        self.tableView.beginUpdates()
        self.myChatArray.remove(at: index)
        let iPath = IndexPath(item: index, section: 1)
        self.tableView.deleteRows(at: [iPath], with: .right)
        self.tableView.endUpdates()
        print("trubisky 1")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if  indexPath.row < 1 {
            let vc = EmojiPickerVC(style: .plain)
            vc.chatID = self.myChatArray[indexPath.row].chatID
//            vc.completionHandler = completionHandler
            vc.title = "Rate the Exchange"
            let nvc = UINavigationController(rootViewController: vc)
            nvc.modalPresentationStyle = .popover
            nvc.popoverPresentationController?.delegate = self
            nvc.popoverPresentationController?.sourceView = tableView.cellForRow(at: indexPath)!
            nvc.popoverPresentationController?.permittedArrowDirections = [.up, .right, .left, .down]
            self.present(nvc, animated: true, completion: nil)
            
        }else {
        
        let chatID = "123456789"
        let chatName = "The Junto"
        
        let chatVC = ChatVC(collectionViewLayout: UICollectionViewFlowLayout())
        chatVC.chatID = chatID
        chatVC.chatName = chatName
        
        chatVC.title = chatName
        
        DispatchQueue.main.async {
            UIApplication.topViewController()?.dismiss(animated: true)
            
            chatVC.hidesBottomBarWhenPushed = true
            UIApplication.topViewController()?.navigationController?.pushViewController(chatVC, animated: true)
        }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }


}

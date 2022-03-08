//
//  MyProfileVC.swift
//  Pluto
//
//  Created by Hunain Ali on 4/23/20.
//  Copyright © 2020 BUMP. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MyProfileVC: UITableViewController {
    
    override init(style: UITableView.Style) {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var myProfileFetcher : MyUserProfileFetcher?
    var myUser : UserProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.setupBarButton()
//        self.setupSegmentControl()
        
        self.setupFetcher()
        
        self.tableView.register(AccessoryTableViewCell.classForCoder(), forCellReuseIdentifier: "myProfileCell")
        
        self.tableView.register(SubtitleTableViewCell.classForCoder(), forCellReuseIdentifier: "myProfileCell2")
    }
    
    
    func shutDown() {
        self.dismiss(animated: false, completion: nil)
        self.navigationController?.popToRootViewController(animated: false)
        
        self.myProfileFetcher?.shutDown()
        self.myProfileFetcher = nil
        self.myUser = nil
        
        
        self.tableView.reloadData()
        
    }
    
    
    //MARK: - Setup
    
    
    func setupBarButton() {
        let btn = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settingsButtonTapped))
        self.navigationItem.setRightBarButtonItems([btn], animated: true)
    }
    
    @objc func settingsButtonTapped() {
//        guard LoginManager.shared.isLoggedIn() else { return }
//
//        let vc = SettingsVC(style: .insetGrouped)
//        vc.title = "Settings"
//        let nvc = UINavigationController(rootViewController: vc)
//        nvc.modalPresentationStyle = .pageSheet
//        self.present(nvc, animated: true, completion: nil)
        
    }
    
    
    
    //MARK: - Table view header
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        } else{
            return "My Score"
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let myU = self.myUser else { return 0 }
        if section == 0 {
            return 3
        } else {
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.imageView?.sd_cancelCurrentImageLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myProfileCell", for: indexPath)
        
        guard let myU = self.myUser else { return cell }
        
        cell.textLabel?.numberOfLines = 99
        cell.imageView?.image = nil
        cell.detailTextLabel?.text = nil
        cell.textLabel?.text = nil
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                cell.imageView?.center = cell.center
                let transformer = SDImageResizingTransformer(size: CGSize(width: 200, height: 200), scaleMode: .aspectFill)
                cell.imageView?.sd_setImage(with: URL(string: myU.imageURL), placeholderImage: UIImage(named: "travisScott")?.resizedImage(newSize: CGSize(width:  100.0, height: 100.0)), options: [.scaleDownLargeImages], context: [.imageTransformer: transformer], progress: nil, completed: { (image, err, cacheType, url) in
                    cell.imageView?.image = cell.imageView?.image?.resizedImage(newSize: CGSize(width: 100.0, height: 100.0))
                    cell.imageView?.layer.masksToBounds = true
                    cell.imageView?.layer.cornerRadius = 10
                })
//                cell.imageView?.image = UIImage(named: "travisScott")?.resizedImage(newSize: CGSize(width:  100.0, height: 100.0))
                cell.imageView?.layer.cornerRadius = 12.0
                cell.imageView?.layer.masksToBounds = true
                
                cell.textLabel?.text = ""
                cell.detailTextLabel?.text = "Edit"
            }
            if indexPath.row == 1 {
                cell.textLabel?.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
                cell.textLabel?.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize, weight: .semibold)
                cell.textLabel?.textColor = .label
                
                cell.textLabel?.text = ""
                cell.textLabel?.text = myU.name
                cell.detailTextLabel?.text = "Edit"
            }
            if indexPath.row == 2 {
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
                cell.textLabel?.textColor = UIColor.label
                cell.textLabel?.numberOfLines = 3
                
//                cell.textLabel?.text = ""
                cell.textLabel?.text = myU.description
                cell.detailTextLabel?.text = "Edit"
            }
        }
        
        cell.accessoryType = .disclosureIndicator
        
        if indexPath.section == 1 {
            
            
//            cell = tableView.dequeueReusableCell(withIdentifier: "myProfileCell2", for: indexPath)
            
            cell.textLabel?.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: .regular)
            
            
            if indexPath.row == 1 {
                cell.textLabel?.text = "How it works"
                cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
                cell.textLabel?.textColor = .secondaryLabel
            } else {
                cell = tableView.dequeueReusableCell(withIdentifier: "myProfileCell2", for: indexPath)
                cell.accessoryType = .detailButton
                cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
                cell.textLabel?.text = "34.23"

                cell.textLabel?.textColor = .label
                cell.detailTextLabel?.textColor = .secondaryLabel
                
                cell.detailTextLabel?.text = "Rank 7/48"
//                cell.detailTextLabel?.text = "Grinnell Avg: 22.59"
                
            }
            
        }
        
            
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let myU = self.myUser else { return }
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                self.editImageTapped()
            }
            if indexPath.row == 1 {
                self.editNameTapped()
            }
            if indexPath.row == 2 {
                self.editDescriptionTapped()
            }
            
        } else {
            let vc = InfoVC(style: .insetGrouped)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    
    func randomEmoji() -> String {
        let names = ["😀","😁","😂","😃","😄","😅","😆","😇","😈","👿","😉","😊","☺️","😋","😌","😍","😎","😏","😐","😑","😒","😓","😔","😕","😖","😗","😘","😙","😚","😛","😜","😝","😞","😟","😠","😡","😢","😣","😤","😥","😦","😧","😨","😩","😪","😫","😬","😭","😮","😯","😰","😱","😲","😳","😴","😵","😶","😷","😸","😹","😺","😻","😼","👻","💩","💀","👽","👾","👍","👍🏻","🌱","🌲","🌳","🌴","🌵","🌷","🌸","🌹","🌺","🌻","🌼","💐","🌾","🌿","🍀","🍁","🍂","🍃"]

        return names.randomElement()!
    }
    
}



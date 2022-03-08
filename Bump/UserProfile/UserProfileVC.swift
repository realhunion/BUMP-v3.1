//
//  UserProfileVC.swift
//  Pluto
//
//  Created by Hunain Ali on 4/19/20.
//  Copyright © 2020 BUMP. All rights reserved.
//

import UIKit
import QuickLayout
import SDWebImage

class UserProfileVC: UITableViewController {
    
    var userID : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.setupFetcher()
        
        self.tableView.register(SubtitleTableViewCell.self.classForCoder(), forCellReuseIdentifier: "userProfileCell")
    }
    
    func setupHeaderProfile(user : User) {
        
        let v = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 300))
        v.backgroundColor = .systemGroupedBackground
        
        let userImageView = UIImageView()
        userImageView.backgroundColor = UIColor.green.withAlphaComponent(0.8)
        userImageView.sd_setImage(with: URL(string: user.imageURL), completed: nil)
        userImageView.clipsToBounds = true
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = 16.0
        userImageView.backgroundColor = .systemBackground
        v.addSubview(userImageView)
        
        let nameLabel = UILabel()
        nameLabel.text = user.name
        nameLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        nameLabel.textAlignment = .center
        v.addSubview(nameLabel)
        
        let descripLabel = UILabel()
        if user.classYear == 1 { descripLabel.text = "1st Year · \(user.description)" }
        else if user.classYear == 2 { descripLabel.text = "2nd Year · \(user.description)" }
        else if user.classYear == 3 { descripLabel.text = "3rd Year · \(user.description)" }
        else if user.classYear == 4 { descripLabel.text = "4th Year · \(user.description)" }
        else { descripLabel.text = user.description }
        descripLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        descripLabel.textAlignment = .center
        descripLabel.numberOfLines = 2
        v.addSubview(descripLabel)
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userImageView.layoutToSuperview(.centerX)
        userImageView.layoutToSuperview(.top, offset: 20)
        userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 1.0).isActive = true
        
        nameLabel.set(.height, of: 40.0)
        nameLabel.layout(.top, to: .bottom, of: userImageView, offset: 10)
        nameLabel.layoutToSuperview(.left, offset: 30)
        nameLabel.layoutToSuperview(.right, offset: -30)
        
        descripLabel.set(.height, of: 40.0)
        descripLabel.layout(.top, to: .bottom, of: nameLabel, offset: 0)
        descripLabel.layoutToSuperview(.bottom, offset: -20)
        descripLabel.layoutToSuperview(.left, offset: 30)
        descripLabel.layoutToSuperview(.right, offset: -30)
        
        
        self.tableView.tableHeaderView = v
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Score"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.imageView?.sd_cancelCurrentImageLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userProfileCell", for: indexPath)
        
        cell.accessoryType = .none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        cell.textLabel?.text = "\(Int.random(in: 38...51)).\(Int.random(in: 11...99))"

        cell.textLabel?.textColor = .label
//        cell.detailTextLabel?.textColor = .secondaryLabel
//
//        cell.detailTextLabel?.text = "Rank \(Int.random(in: 8...44))/48"
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
}

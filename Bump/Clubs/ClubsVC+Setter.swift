//
//  ClubsVC+Setter.swift
//  Bump
//
//  Created by Hunain Ali on 11/26/20.
//

import UIKit

extension ClubsVC {
    
    
    
    func createButtonTapped() {
        
        let ac = UIAlertController(title: "Create a Club", message: nil, preferredStyle: .alert)
        ac.addTextField(configurationHandler: { textField in
            textField.placeholder = "Name"
        })
        ac.addTextField(configurationHandler: { textField in
            textField.placeholder = "Question to Discuss"
        })

        let submitAction = UIAlertAction(title: "Done", style: .default) { UIAlertAction in
            guard let name = ac.textFields![0].text else { return }
            guard let description = ac.textFields![1].text else { return }
            
                guard let c = ClubsSetter.shared.createClub(name: name, description: description) else { return }
                self.clubArray.insert(c, at: 0)
                self.tableView.reloadData()
            
            
            // do something interesting with "answer" here
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        ac.addAction(cancelAction)
        ac.addAction(submitAction)

        DispatchQueue.main.async {
            self.present(ac, animated: true)
        }
        
    }
    
    
    func joinButtonTapped(club : Club) {
        let clubID = club.clubID
        
        //Change Server
        if club.isJoined() {
            ClubsSetter.shared.leaveClub(clubID: clubID) { (isEmpty) in
                if isEmpty {
                    self.clubArray.removeAll(where: {$0.clubID == clubID})
                    self.tableView.reloadData()
                }
            }
        } else {
            ClubsSetter.shared.joinClub(clubID: clubID)
        }
        
        //Change Locally
        self.clubArray.first(where: {$0.clubID == clubID})?.toggleJoin()
        if let index = self.clubArray.firstIndex(where: {$0.clubID == clubID}) {
            let section = index + 1
            self.tableView.reloadSections(IndexSet(arrayLiteral: section), with: .fade)
        } else {
            self.tableView.reloadData()
        }
    }
    
    
}

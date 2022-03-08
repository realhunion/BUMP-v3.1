//
//  Club.swift
//  Bump
//
//  Created by Hunain Ali on 11/22/20.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class Club {
    var clubID : String
    var name : String
    var description : String
    var userIDArray : [String] = []
    var timestamp : Timestamp
    init(clubID : String, name : String, description : String, userIDArray : [String], timestamp : Timestamp) {
        self.clubID = clubID
        self.name = name
        self.description = description
        self.userIDArray = userIDArray
        self.timestamp = timestamp
    }
    
    
    func isJoined() -> Bool {
        guard let myUID = Auth.auth().currentUser?.uid else { return false }
        return self.userIDArray.contains(myUID)
    }
    
    func toggleJoin() {
        guard let myUID = Auth.auth().currentUser?.uid else { return }
        if !isJoined() {
            
            self.userIDArray.append(myUID)
            
        } else {
            
            self.userIDArray.removeAll(where: {$0==myUID})
        }
    }
}

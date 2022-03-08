//
//  ClubsFetcher.swift
//  Bump
//
//  Created by Hunain Ali on 11/26/20.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

protocol ClubsFetcherDelegate : class {
    func clubsUpdated(clubArray : [Club])
}


class ClubsFetcher {
    
    var db = Firestore.firestore()
    
    weak var delegate : ClubsFetcherDelegate?
    var listener : ListenerRegistration?
    
    init() {
    }
    
    func shutDown() {
        self.delegate = nil
        if let listenr = self.listener {
            listenr.remove()
        }
    }
    
    
    
    
    func getClubs() {
        
        guard let myUID = Auth.auth().currentUser?.uid else { return }
        
        db.collection("Clubs").getDocuments(completion: { (snap, err) in
            guard let docs = snap?.documents else { return }
            
            var cArray = [Club]()
            
            for doc in docs {
                
                if let name = doc.data()["name"] as? String,
                   let description = doc.data()["description"] as? String,
                   let userIDArray = doc.data()["userIDArray"] as? [String],
                   let timestamp = doc.data()["timestamp"] as? Timestamp {
                    let c = Club(clubID : doc.documentID, name: name, description: description, userIDArray: userIDArray, timestamp: timestamp)
                    cArray.append(c)
                }
            }
            
            self.delegate?.clubsUpdated(clubArray: cArray)
            
        })
        
    }
}

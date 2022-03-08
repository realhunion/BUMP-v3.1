//
//  ClubsSetter.swift
//  Bump
//
//  Created by Hunain Ali on 11/26/20.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ClubsSetter {
    
    static let shared : ClubsSetter = ClubsSetter()
    
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
    
    
    
    
    func createClub(name : String, description : String) -> Club? {
        
        guard let myUID = Auth.auth().currentUser?.uid else { return nil }
        
        let payload = ["name":name, "description":description, "userIDArray":[myUID], "timestamp":Timestamp(date: Date())] as [String : Any]
        let jj = db.collection("Clubs").addDocument(data: payload)
        
        let club = Club(clubID: jj.documentID, name: name, description: description, userIDArray: [myUID], timestamp: Timestamp(date: Date()))
        return club
        
    }
    
    func joinClub(clubID : String) {
        
        guard let myUID = Auth.auth().currentUser?.uid else { return }
        
        let payload = ["userIDArray": FieldValue.arrayUnion(["\(myUID)"])]
        db.collection("Clubs").document(clubID).updateData(payload)
        
    }
    
    func leaveClub(clubID : String, completion: @escaping (_ isEmpty: Bool) -> Void) {
        
        guard let myUID = Auth.auth().currentUser?.uid else { return }
        
        let payload = ["userIDArray": FieldValue.arrayRemove(["\(myUID)"])]
        db.collection("Clubs").document(clubID).updateData(payload) { (err) in
            self.checkClub(clubID: clubID) { (isEmpty) in
                completion(isEmpty)
            }
        }
    }
    
    private func checkClub(clubID : String, completion: @escaping (_ isEmpty: Bool) -> Void) {
        
            self.db.collection("Clubs").document(clubID).getDocument { (snap, errr) in
                if let array = snap?.data()?["userIDArray"] as? [String] {
                    if array.isEmpty {
                        self.db.collection("Clubs").document(clubID).delete()
                        completion(true)
                    } else {
                    completion(false)
                    }
                } else {
                    self.db.collection("Clubs").document(clubID).delete()
                    completion(true)
                }
            }
        
    }
}

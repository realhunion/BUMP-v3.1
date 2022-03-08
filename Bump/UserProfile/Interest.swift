//
//  InterestProfile.swift
//  Pluto
//
//  Created by Hunain Ali on 4/19/20.
//  Copyright © 2020 BUMP. All rights reserved.
//

import Foundation
import Firebase

//struct MetaUser {
//    var userID : String
//    var name : String
//    func getImageRef() -> StorageReference {
//        let userImagePath = "User-Profile-Images/\(self.userID).jpg"
//        let storageRef = Storage.storage()
//        return storageRef.reference(withPath: userImagePath)
//    }
//}

class UserProfile {
    
    var userID : String
    var email : String
    var name : String
    var description : String
    var imageURL : String
    var interests : [String]
    var dateJoined : Timestamp
    var classYear : Int
    init(userID : String, email : String, name : String, description : String, imageURL : String, interests : [String], dateJoined : Timestamp, classYear : Int) {
        self.userID = userID
        self.email = email
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.interests = interests
        self.dateJoined = dateJoined
        self.classYear = classYear
    }
    
}

class User {
    
    var userID : String
    var email : String
    var name : String
    var description : String
    var imageURL : String
    var interests : [String]
    var dateJoined : Timestamp
    var classYear : Int
    init(userID : String, email : String, name : String, description : String, imageURL : String, interests : [String], dateJoined : Timestamp, classYear : Int) {
        self.userID = userID
        self.email = email
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.interests = interests
        self.dateJoined = dateJoined
        self.classYear = classYear
    }
    
}

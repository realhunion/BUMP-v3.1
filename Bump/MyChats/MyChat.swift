//
//  MyChat.swift
//  Bump
//
//  Created by Hunain Ali on 11/26/20.
//

import FirebaseFirestore

struct MetaUser {
    var userID : String
    var name : String
    var lastUpdated : Timestamp
}

class MyChat {
    
    var chatID : String
    var clubName : String
    var userArray : [MetaUser]
    
    init(chatID : String, clubName : String, userArray : [MetaUser]) {
        self.chatID = chatID
        self.clubName = clubName
        self.userArray = userArray
    }
    
    
    func getChatName() -> String {
        var name = ""
        if userArray.count == 0 {
            name = "Who is it?"
        }
        else if userArray.count == 1 {
            name = userArray[0].name
        }
        else if userArray.count == 2 {
            name = userArray[0].name + " & " + userArray[1].name
        }
        else {
            name = userArray[0].name
            var index = 1
            while index < userArray.count-1 {
                name += ", \(userArray[index].name)"
                index += 1
            }
            name += ", and \(userArray[userArray.count-1].name)"
            
        }
        return name
    }
    
}

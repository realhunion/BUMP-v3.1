//
//  UserProfile+Connections.swift
//  Pluto
//
//  Created by Hunain Ali on 4/22/20.
//  Copyright © 2020 BUMP. All rights reserved.
//

import Foundation
import Firebase

extension UserProfileVC  {
    
    
    func setupFetcher() {
        
        
        let u = User(userID: "dede", email: "bhink", name: "Jeni Mason", description: "thinking about philosophy", imageURL: "https://i.pinimg.com/originals/3b/26/2d/3b262db7ec749e99dbdeed4d787f951c.jpg", interests: [], dateJoined: Timestamp(date: Date()), classYear: 1)
            self.setupHeaderProfile(user: u)
    }
    
    
    
    
    
        
    
    
    
}

//
//  MyProfileVC+Fetcher.swift
//  Pluto
//
//  Created by Hunain Ali on 4/29/20.
//  Copyright © 2020 BUMP. All rights reserved.
//

import Foundation
import UIKit
import Firebase


extension MyProfileVC : MyUserProfileFetcherDelegate {
    
    
    //MARK: fetcher
    
    func setupFetcher() {
        self.setupMyProfileFetcher()
    }
    
    
    
    //MARK: myProf
    
    func myProfileUpdated(userProfile: UserProfile) {
        
        print("tis")
        
        self.myUser = userProfile
//        self.myUser?.interests.sort(by: {Int($0.interestID) ?? 0 < Int($1.interestID) ?? 1})
        
        self.tableView.reloadData()
        
    }
    
    func setupMyProfileFetcher() {
        
        self.myProfileFetcher = MyUserProfileFetcher()
        self.myProfileFetcher?.delegate = self
        self.myProfileFetcher?.monitorMyProfile()
    }

}

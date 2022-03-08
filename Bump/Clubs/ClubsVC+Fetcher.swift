//
//  ClubsVC+Fetcher.swift
//  Bump
//
//  Created by Hunain Ali on 11/26/20.
//

import Foundation

extension ClubsVC : ClubsFetcherDelegate {
    
    
    func clubsUpdated(clubArray: [Club]) {
        self.clubArray = clubArray
        self.tableView.reloadData()
    }
    
    
    func setupClubsFetcher() {
        self.clubsFetcher = ClubsFetcher()
        self.clubsFetcher?.delegate = self
        self.clubsFetcher?.getClubs()
    }
    
    
    
}

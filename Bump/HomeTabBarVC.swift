//
//  ViewController.swift
//  BUMP
//
//  Created by Hunain Ali on 10/20/19.
//  Copyright © 2019 BUMP. All rights reserved.
//

import UIKit
import Firebase
//import SwiftEntryKit

enum Tabs: Int {
    case feed = 0
    case launch = 1
    case hub = 2
}

class HomeTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.delegate = self
        
//        self.tabBar.isTranslucent = false
//        self.tabBar.backgroundColor = .white
//        self.tabBar.barTintColor = .white
        
    }
    
    func shutDown() {
        
        
    }
    
    
    
    
    var vc1 = MyChatsVC(style: .insetGrouped)
    
    var vc2 = SwipeVC()
    
    var vc3 = TableVC(style: .insetGrouped)
    
    var vc4 = MyProfileVC(style: .insetGrouped)
    
    func setupTabBar() {
        
        //FIX: FUTURE circle INFO large title adjustfonttoFItWidth do it.
        
//        launchVC.view.backgroundColor = .white
//        hubVC.view.backgroundColor = .white
        
        vc1.title = "Chats"
        vc2.title = "Clubs"
        vc3.title = "Activity"
        vc4.title = "Me"
        
        let  nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        let nc3 = UINavigationController(rootViewController: vc3)
        
        let nc4 = UINavigationController(rootViewController: vc4)

        nc1.navigationBar.prefersLargeTitles = true
        nc1.navigationBar.layoutMargins.left = 36
        nc2.navigationBar.prefersLargeTitles = true
        nc2.navigationBar.layoutMargins.left = 36
        nc3.navigationBar.prefersLargeTitles = true
        nc3.navigationBar.layoutMargins.left = 36
        
        nc4.navigationBar.prefersLargeTitles = true
        nc4.navigationBar.layoutMargins.left = 36
        
//        feedNC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkText]
//        launchNC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkText]
//        hubNC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkText]
        
        let feedImage =  UIImage(named: "chatIcon")!.resizedImage(newSize: CGSize(width: 30, height: 30))
        let launchImage = UIImage(named: "geniusIcon")!.resizedImage(newSize: CGSize(width: 30, height: 30))
        let categoriesImage = UIImage(named: "profileIcon")!.resizedImage(newSize: CGSize(width: 30, height: 30))
        
        let feedItem = UITabBarItem(title: "Chats", image: feedImage, selectedImage: nil)
        let launchItem = UITabBarItem(title: "Clubs", image: launchImage, selectedImage: nil)
        let hubItem = UITabBarItem(title: "Me", image: categoriesImage, selectedImage: nil)
        
        let activityItem = UITabBarItem(title: "Activity", image: UIImage(named: "heartIcon")!.resizedImage(newSize: CGSize(width: 30, height: 30)), selectedImage: nil)
        
        feedItem.tag = 0
        launchItem.tag = 1
        hubItem.tag = 2
        
        vc1.tabBarItem = feedItem
        vc2.tabBarItem = launchItem
        vc3.tabBarItem = activityItem
        vc4.tabBarItem = hubItem
        
        let tabBarControllers = [nc2, nc4]
        self.viewControllers = tabBarControllers
        self.selectedIndex = currentIndex
        
        
        
    }
    
    
    
    
    var currentIndex : Int = 0
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        currentIndex = selectedIndex
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        
        if selectedIndex == Tabs.feed.rawValue {
//            if !LoginManager.shared.isLoggedIn() {
//                self.selectedIndex = currentIndex
//            }
        }
        
        
        if selectedIndex == Tabs.hub.rawValue {
//            if !LoginManager.shared.isLoggedIn() {
//                self.selectedIndex = currentIndex
//            }
        }
        
        
    }
    
    
    

}

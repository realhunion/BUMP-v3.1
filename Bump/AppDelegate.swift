//
//  AppDelegate.swift
//  Bump
//
//  Created by Hunain Ali on 11/14/20.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var db : Firestore!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.configureMyFirebase()
        
//        Auth.auth().signIn(withEmail: "alihunai@grinnell.edu", password: "-", completion: { (result, err) in
//            print(".............\(result)")
//            print(".............---\(err)")
//        })
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        self.bump = BUMP()
        window?.rootViewController = HomeTabBarVC()
        window?.makeKeyAndVisible()
        
        return true
    }

    
    
    // MARK: - Configure Firebase
    
    func configureMyFirebase() {
        FirebaseApp.configure()
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        self.db = Firestore.firestore()
        Firestore.firestore().settings = settings
        Database.database().isPersistenceEnabled = false
    }
    
    
}


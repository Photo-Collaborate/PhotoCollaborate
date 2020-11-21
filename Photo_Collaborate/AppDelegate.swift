//
//  AppDelegate.swift
//  Photo_Collaborate
//
//  Created by Sabahet Alovic on 11/12/20.
//  Copyright © 2020 Sabahet Alovic. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UIImagePickerControllerDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "UH2I21kekAYEhIaOW0qEVu2cKkTbTzBlG3i9tqfD"
            $0.clientKey = "AajJJiFr2GsV2KtO0fkkKjhEMM0I7L6hm8Yx6gVx"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


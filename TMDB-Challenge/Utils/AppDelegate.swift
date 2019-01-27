//
//  AppDelegate.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/22/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return initialController()
    }
    
    func initialController() -> Bool {
        
        let root = ViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = root
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}


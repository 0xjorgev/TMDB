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
        
        let root = ViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = root
        
        window?.makeKeyAndVisible()
        
        testService()
        
        return true
    }
    
    func testService(){
        
        Service.shared.getMovieSearch(query: "Alien", page: 1, completion: { (res, error) in
            
            if error == nil {
                print("Search movies: \(String(describing: res?.result))")
                //assert(res?.title == "Lock, Stock and Two Smoking Barrels", "Title is OK")
            } else {
                print("Search movies: Error")
                //assert(false , "Broken")
            }
        })
    }


}


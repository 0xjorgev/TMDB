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
        
        testService()
        
        return initialController()
    }
    
    func initialController() -> Bool {
        
        let root = ViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = root
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func testService(){
        
        Service.shared.getRelatedMovies(id: "503314") { (res, err) in
            if res != nil {
                print("Realted movies: \(String(describing: res?.results)) ")
                //assert(res?.title == "Lock, Stock and Two Smoking Barrels", "Title is OK")
            } else {
                
                print("Error: \(err)")
            }
        }
        
//        Service.shared.getUpcomingMovies(page: 1, completion: { (res, error) in
//
//            if res != nil {
//                print("Upcoming movies: \(String(describing: res?.result))")
//                //assert(res?.title == "Lock, Stock and Two Smoking Barrels", "Title is OK")
//            }
//        })
    }


}


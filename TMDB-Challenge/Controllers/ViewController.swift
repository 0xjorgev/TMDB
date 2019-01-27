//
//  ViewController.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/22/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [createHomeController(), createSearchController()]
        
        self.view.backgroundColor = .black
        
        self.tabBar.barTintColor = Colors.darkColor
        
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
        
    }

}

extension ViewController {
    
    func createHomeController() -> UINavigationController {
        
        let controller = HomeViewController.init(items: []
            , identifier: "MovieTableViewCell"
            , configure: { cell, item in
                
                cell.movie = item
                
            }
            , selectHandler: {_ in }
            , sectionTitle: nil)
        
        
        let controllerNavigation = UINavigationController(rootViewController: controller)
        
        controllerNavigation.navigationBar.prefersLargeTitles = true
        
        controllerNavigation.navigationBar.barTintColor = Colors.darkColor
        
        controller.navigationItem.title = "Upcoming"
        
        let textAttributes:[NSAttributedString.Key:Any]? =
            [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):Colors.mainColor
                ,NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue):UIFont.boldSystemFont(ofSize: 16.0)]
        
        let bigTextAttributes:[NSAttributedString.Key:Any]? =
            [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):Colors.mainColor
                ,NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue):UIFont.boldSystemFont(ofSize: 28.0)]
        
        controller.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        controller.navigationController?.navigationBar.largeTitleTextAttributes = bigTextAttributes
        
        let img = UIImage(named: "home")
        
        let controllerItem = UITabBarItem(title: "Home", image: img, tag: 0)
        
        controller.tabBarItem = controllerItem
        
        
        return controllerNavigation
        
    }
    
    
    func createSearchController() -> UINavigationController {
        
        let controller = SearchTableViewController.init(items: []
            , identifier: "MovieTableViewCell"
            , configure: { cell, item in
                
                cell.movie = item
                
        }
            , selectHandler: { _ in }
            , sectionTitle: nil)
        
        
        let controllerNavigation = UINavigationController(rootViewController: controller)
        
        controllerNavigation.navigationBar.prefersLargeTitles = true
        
        controllerNavigation.navigationBar.barTintColor = Colors.darkColor
        
        controller.navigationItem.title = "Search"
        
        let textAttributes:[NSAttributedString.Key:Any]? =
            [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):Colors.mainColor
                ,NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue):UIFont.boldSystemFont(ofSize: 16.0)]
        
        let bigTextAttributes:[NSAttributedString.Key:Any]? =
            [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):Colors.mainColor
                ,NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue):UIFont.boldSystemFont(ofSize: 28.0)]
        
        controller.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        controller.navigationController?.navigationBar.largeTitleTextAttributes = bigTextAttributes
        
        let img = UIImage(named: "search")
        
        let controllerItem = UITabBarItem(title: "Search", image: img, tag: 1)
        
        controller.tabBarItem = controllerItem
        
        return controllerNavigation
        
    }
    
    
}

extension UINavigationController {
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}


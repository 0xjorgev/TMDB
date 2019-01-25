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
        
        viewControllers = [createHomeController()]
        
        self.view.backgroundColor = .white
        
        self.tabBar.isTranslucent = false
        
        self.tabBar.barTintColor = Colors.darkColor
        
    }


}

extension ViewController {
    
    func createHomeController() -> UINavigationController {
        
        let controller = HomeViewController.init(items: []
            , identifier: "MovieTableViewCell"
            , configure: { cell, item in
                
                cell.cellData = MovieTableViewCell.CellData.init(movie: item)
                
            }
            , selectHandler: { _ in }
            , sectionTitle: nil)
        
        
        let controllerNavigation = UINavigationController(rootViewController: controller)
        
        controllerNavigation.navigationBar.prefersLargeTitles = true
        
        controllerNavigation.navigationBar.tintColor = Colors.darkColor
        
        controller.navigationItem.title = "Upcoming Movies"
        
        
        let img = UIImage(named: "home")
        
        let controllerItem = UITabBarItem(title: "Home", image: img, tag: 0)
        
        controller.tabBarItem = controllerItem
        
        return controllerNavigation
        
    }
}


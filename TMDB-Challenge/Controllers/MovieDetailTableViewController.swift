//
//  MovieDetailTableViewController.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/25/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class MovieDetailTableViewController: UITableViewController {
    
    let movieDetailCellIdentifier = "MovideDetailsTableViewCell"
    
    let movieOverviewTableViewCellIdentifier = "MovieOverviewTableViewCell"
    
    let movieInformationTableViewCellIdentifier = "MovieInformationTableViewCell"
    
    let movieLanguageTableViewCellIdentifier = "MovieLanguageTableViewCell"
    
    let relatedMoviesTableViewCellIdentifier = "RelatedMoviesTableViewCell"
    
    var item:Movie?{
        
        didSet{
            
            OperationQueue.main.addOperation {
                
                self.customizeTableViewHeader()
                
                self.tableView.reloadData()
                
            }
        }
    }
    
    var itemId:Int?{
        didSet{
            
            Service.shared.getMovieById(id: "\(itemId ?? 0)") { (res, err) in
                if res != nil {
                    
                    self.item = res
                    
                }
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        tableView.separatorStyle = .none
        
        tableView.register(MovideDetailsTableViewCell.self, forCellReuseIdentifier: movieDetailCellIdentifier)
        
        tableView.register(MovieOverviewTableViewCell.self, forCellReuseIdentifier: movieOverviewTableViewCellIdentifier)
        
        tableView.register(MovieInformationTableViewCell.self, forCellReuseIdentifier: movieInformationTableViewCellIdentifier)
        
        tableView.register(MovieLanguageTableViewCell.self, forCellReuseIdentifier: movieLanguageTableViewCellIdentifier)
        
        tableView.register(RelatedMoviesTableViewCell.self, forCellReuseIdentifier: relatedMoviesTableViewCellIdentifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customNavigationStyle()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 5 }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? { return UIView() }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { return UIView() }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 0.0 }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: movieDetailCellIdentifier, for: indexPath) as! MovideDetailsTableViewCell
            
            cell.movie = self.item
            
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: movieOverviewTableViewCellIdentifier, for: indexPath) as! MovieOverviewTableViewCell
            
            cell.movie = self.item
            
            return cell
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: movieInformationTableViewCellIdentifier, for: indexPath) as! MovieInformationTableViewCell
            
            cell.movie = self.item
            
            return cell
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: movieLanguageTableViewCellIdentifier, for: indexPath) as! MovieLanguageTableViewCell
            
            cell.movie = self.item
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: relatedMoviesTableViewCellIdentifier, for: indexPath) as! RelatedMoviesTableViewCell
            
            cell.movie = self.item
            
            return cell
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 1: return "".estimateLabelHeigth(text: self.item?.overview, size: 12.0, padding: 24.0) + 42.0
        case 2: return 225.0
        case 3: return 115.0
        case 4: return 245.0
        default: return 160.0
            
        }
        
    }
    
    func customizeTableViewHeader(){
        
        let head = TableViewHeaderView()
        
        guard let backdrop = self.item?.backdropPath else { return }
        
        head.frame = CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: 140.0)
        
        head.createViews()
        
        head.imageUrl = "\(PORT_URL)\(backdrop)"
        
        self.tableView.tableHeaderView = head
    }
    
    func customNavigationStyle(){
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.navigationController?.navigationBar.tintColor = Colors.mainColor
        
    }
 
}

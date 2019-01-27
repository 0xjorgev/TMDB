//
//  SearchTableViewController.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class SearchTableViewController: GenericTableViewController<Movie, MovieTableViewCell>, UISearchBarDelegate{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        searchController = UISearchController(searchResultsController: nil)
        
        self.refreshControl = UIRefreshControl()
        
        navigationItem.searchController = searchController
        
        searchController?.obscuresBackgroundDuringPresentation = false
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
        
        //refreshControl?.addTarget(self, action: #selector(refresData), for: .valueChanged)
        
        self.searchController?.searchBar.delegate = self
    }
    
    @objc func refresData(_ sender: Any) {
        // Fetch Weather Data
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    override func getData() {
        
        
        Service.shared.getMovieSearch(query: self.searchController?.searchBar.text, page: 1, completion: { (res, err) in
            
            if res != nil {
                
                DispatchQueue.main.async{
                    
                    self.items = res?.result
                    
                    self.tableView.reloadData()
                }
            }
            
            self.stopSpinner()
        })
    }
    
//    override func customizeTableViewHeader(){
//
//        let head = TableViewHeaderView()
//
//        head.createViews()
//
//        head.imageName = "Search"
//        // header = header
//
//        head.frame = CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: 145.0)
//
//        self.tableView.tableHeaderView = head
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = MovieDetailTableViewController()
        
        let item = items?[indexPath.row]
        
        detail.itemId = item?.id
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) { items = [] }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { getData() }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//
////        if itemsCopy.count == 0 {
////            itemsCopy = items!
////        }
////
////        if searchText.count != 0 {
////
////            filterByText(item: searchBar.text ?? "")
////
////        } else {
////
////            items = itemsCopy
////
////            itemsCopy = []
////        }
//    }
    
//    func filterByText(item:String) {
//
//        items = items?.filter{ $0.title!.contains(item) } ?? []
//    }
    
}

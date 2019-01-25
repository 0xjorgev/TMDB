//
//  HomeViewController.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class HomeViewController: GenericTableViewController<Movie, MovieTableViewCell>{
    
    var fetchingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
       // self.searchController?.searchBar.delegate = self
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height * 4 {
            
            if !fetchingMore  && currentPage <= self.totalPages {

                self.currentPage += 1
                
                self.getData()
            }
        }
    }
    
    override func getData() {
        
        fetchingMore = true
        
        //print("Current page: \(currentPage)")
        
        Service.shared.getUpcomingMovies(page: currentPage, completion: { (res, err) in
            
            if res != nil {
                
                self.items! += res?.result ?? []
                
                //print("Items count: \(self.items?.count)")
                
                self.currentPage = res?.page ?? 0
                
                self.totalPages = res?.totalPages ?? 0
                
                DispatchQueue.main.async{
                        
                    self.fetchingMore = false
                    
                    self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
                    
                    self.tableView.reloadData()
                }
            }
            
            self.stopSpinner()
        })
    }
    
    override func customizeTableViewHeader(){
        
        let head = TableViewHeaderView()
        
        head.createViews()
        
       // header = header
        
        head.frame = CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: 145.0)
        
        self.tableView.tableHeaderView = head
        
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //items = itemsCopy
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.count != 0 {
            filterByText(item: searchBar.text ?? "")
        } else {
            //items = itemsCopy
        }
    }
    
    func filterByText(item:String) {
        
        items = items?.filter{
            $0.title!.contains(item)
        } ?? []
    }
    
}

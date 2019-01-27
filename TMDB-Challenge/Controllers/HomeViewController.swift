//
//  HomeViewController.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class HomeViewController: GenericTableViewController<Movie, MovieTableViewCell>, UISearchBarDelegate{
    
    var fetchingMore = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        searchController = UISearchController(searchResultsController: nil)
        
        self.refreshControl = UIRefreshControl()
        
        navigationItem.searchController = searchController
        
        searchController?.obscuresBackgroundDuringPresentation = false
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
        
        refreshControl?.addTarget(self, action: #selector(refresData), for: .valueChanged)
        
        self.searchController?.searchBar.delegate = self
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    @objc func refresData(_ sender: Any) {
        
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
        
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
        
        Service.shared.getUpcomingMovies(page: currentPage, completion: { (res, err) in
            
            if res != nil {
                
                self.items! += res?.result ?? []
                
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
        
        head.imageName = "UpcomingHeader"
       // header = header
        
        head.frame = CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: 145.0)
        
        self.tableView.tableHeaderView = head
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = MovieDetailTableViewController()
        
        let item = items?[indexPath.row]
        
        detail.itemId = item?.id
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        items = itemsCopy
        //fetchingMore = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        if itemsCopy.count == 0 {
            itemsCopy = items!
        }
        
        if searchText.count != 0 {
            
            filterByText(item: searchBar.text ?? "")
            
        } else {
            
            items = itemsCopy
            
            itemsCopy = []
        }
    }
    
    func filterByText(item:String) {
        
        items = items?.filter{ $0.title!.contains(item) } ?? []
    }
    
}

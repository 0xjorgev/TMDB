//
//  GenericTableViewController.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class GenericTableViewController<T, Cell: UITableViewCell>: UITableViewController {
    
    var items: [T]? {
        didSet {
            OperationQueue.main.addOperation { self.tableView.reloadData() }
        }
    }
    
    var configure: ((Cell, T?) -> Void)?
    
    var selectHandler: ((T?) -> Void)?
    
    var identifier:String?
    
    var header:UIView?
    
    var sectionTitle:String?
    
    var spinner:UIActivityIndicatorView?
    
    var range:(Date?, Date?)?
    
    var dataBlock:(()->Void)?
    
    var navBlock:(()->Void)?
    
    var cellHeigth:CGFloat?
    
    var currentPage:Int = 1
    
    var totalPages:Int = -1
    
    //var cellSetup:CellSetup?
    
    init(items: [T], identifier:String, configure: @escaping (Cell, T?) -> Void, selectHandler: @escaping (T?) -> Void, sectionTitle:String?) {
        
        self.items = items
        
        self.configure = configure
        
        self.selectHandler = selectHandler
        
        self.identifier = identifier
        
        self.sectionTitle = sectionTitle
        
        self.spinner = UIActivityIndicatorView(style: .gray)
        
        super.init(style: .plain)
        
        self.tableView.backgroundView = self.spinner
        
        self.tableView.register(Cell.self, forCellReuseIdentifier: identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.spinner?.startAnimating()
        
        getData()
        
        print("View did load!")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        customizeTableViewHeader()
        
        print("View will Appear!")
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier!, for: indexPath) as! Cell
        
        let item = items?[indexPath.row]
        
        configure?(cell, item)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items?[indexPath.row]
        
        selectHandler?(item!)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeigth ?? 160.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()//TableViewSectionHeader()
        
        return header
    }
    
    func getData(){ dataBlock?() }
    
    func stopSpinner(){
        OperationQueue.main.addOperation {
            
            self.spinner?.hidesWhenStopped = true
            
            self.spinner?.stopAnimating()
        }
    }
    
    open func customizeTableViewHeader(){
        
    }
    
}

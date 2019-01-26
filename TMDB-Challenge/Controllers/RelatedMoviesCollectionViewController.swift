//
//  RelatedMoviesCollectionViewController.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class RelatedMoviesCollectionViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "RelatedCollectionViewCell"
    
    var collection: UICollectionView!
    
    var itemId:String? {
        didSet{
            
            self.getData()
        }
    }
    
    var items:[ReducedMovie]?{
        didSet{
            OperationQueue.main.addOperation {
                
                self.collection.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createViews()
        
        
    }
    
    func createViews(){
        
        self.view.backgroundColor = .black
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.scrollDirection = .horizontal
        
        self.collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        self.collection.delegate = self
        
        self.collection.dataSource = self
        
        self.collection.register(RelatedCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collection.backgroundColor = .white
        
        self.collection.isPagingEnabled = true
        
        self.view.addSubview(collection)
        
        collection.reloadData()
        
        self.setupConstraints()
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(self.collection.frame.width / 3) - 35.0, height: self.collection.frame.height - 35.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func setupConstraints() {
        
        self.collection.autoPinEdge(.top, to: .top, of: self.view, withOffset: 0.0)
        self.collection.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0.0)
        self.collection.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0.0)
        self.collection.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0.0)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:reuseIdentifier , for: indexPath) as! RelatedCollectionViewCell

        cell.movie = items?[indexPath.row]
        
        return cell
    }
    
    func getData(){
        
        Service.shared.getRelatedMovies(id: itemId) { (res, err) in
            if res != nil {
                
                self.items = res?.results
                
            } else {
                
                print("Error: \(err)")
            }
        }
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

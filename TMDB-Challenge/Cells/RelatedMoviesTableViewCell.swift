//
//  RelatedMoviesTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class RelatedMoviesTableViewCell: UITableViewCell {
    
    var title:UILabel?
    
    var related:RelatedMoviesCollectionViewController?
    
    var movie:Movie?{
        
        didSet{
            
            self.related?.itemId = "\(movie?.id ?? 0)"
        }
        
    }
    
    func createViews(){
        
        self.backgroundColor = .black
        
        
        related = RelatedMoviesCollectionViewController()
        
        related?.createViews()
        
        related?.collection.backgroundColor = .black
        
        self.addSubview(related?.collection ?? UIView())
        
        
        title = UILabel()
        
        title?.addCellTitleStyle(text: "Related")
        
        //title?.backgroundColor = .blue
        
        self.addSubview(title!)
        
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 5.0)
        
        title?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        related?.collection?.autoPinEdge(.top, to: .top, of: self, withOffset: 5.0)
        
        related?.collection?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        related?.collection?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        related?.collection?.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0.0)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)

        // Configure the view for the selected state
    }
    
}

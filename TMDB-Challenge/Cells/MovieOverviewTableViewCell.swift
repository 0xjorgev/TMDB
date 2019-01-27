//
//  MovieOverviewTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class MovieOverviewTableViewCell: UITableViewCell {
    
    var title:UILabel?
    
    var overview:UILabel?
    
    var movie:Movie?{
        
        didSet{
            
            self.overview?.text = movie?.overview ?? ""
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews(){
        
        self.backgroundColor = .black
        
        title = UILabel()
        
        title?.numberOfLines = 1
        
        title?.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        title?.textColor = UIColor.white
        
        title?.text = "Overview"
        
        self.addSubview(title!)
        
        
        overview = UILabel()
        
        overview?.font = UIFont.systemFont(ofSize: 12.0)
        
        overview?.textColor = UIColor.lightGray
        
        overview?.numberOfLines = 0
        
        self.addSubview(overview!)
        
        
        self.accessoryType = .none
        
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 12.0)
        
        title?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        overview?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 8.0)
        
        overview?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        overview?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
    }
    
}

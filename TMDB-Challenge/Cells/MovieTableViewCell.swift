//
//  MovieTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import PureLayout
import moa

class MovieTableViewCell: UITableViewCell {
    
    var poster:UIImageView?
    
    var title:UILabel?
    
    var originalTitle:UILabel?
    
    var language:UILabel?
    
    var extra:UILabel?
    
    //var type:UILabel?
        
    var movie:Movie?{
        didSet{
            
            title?.addAttributedTitle(title: movie?.title, year: movie?.releaseDate)
            
            language?.text = "Original language: \(movie?.originalLanguage ?? "")"
            
            originalTitle?.text = movie?.originalTitle ?? ""
            
            extra?.text = "\(movie?.voteCount ?? 0) / \(movie?.popularity ?? 0.0)"
            
            poster?.image = UIImage(named: "no-image-v")
            
            poster?.moa.url = "\(IMG_URL)\(movie?.posterPath ?? "")"
            
            poster?.moa.onSuccess = { image in
                return image
            }
            
        }
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
    
    func createViews(){
        
        self.backgroundColor = .black
        
        let emptyImage = UIImage(named: "no-image")
        
        poster = UIImageView(image: emptyImage)
        
        poster?.contentMode = .scaleAspectFit
        
        self.addSubview(poster!)
        
        
        title = UILabel()
        
        title?.numberOfLines = 3
        
        self.addSubview(title!)
        
        
        originalTitle = UILabel()
        
        originalTitle?.font = UIFont.italicSystemFont(ofSize: 14.0)
        
        originalTitle?.textColor = UIColor.lightGray
        
        originalTitle?.numberOfLines = 3
        
        self.addSubview(originalTitle!)
        
        
        //Verify with styles
        
        language = UILabel()
        
        language?.font = UIFont.systemFont(ofSize: 13.0)
        
        language?.textColor = UIColor.lightGray
        
        self.addSubview(language!)
        
        
        extra = UILabel()
        
        extra?.font = UIFont.systemFont(ofSize: 11.0)
        
        extra?.textColor = Colors.mainColor
        
        extra?.textAlignment = .center
        
        self.addSubview(extra!)
        
        
        self.accessoryType = .disclosureIndicator
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        let imageHeight:CGFloat = CGFloat(120.0)
        
        let scaleFactor:CGFloat = CGFloat(0.7118)
        
        poster?.autoPinEdge(.top, to: .top, of: self, withOffset: 12.0)
        
        poster?.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        poster?.autoSetDimension(.height, toSize: imageHeight)
        
        poster?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 5.0)
        
        title?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        
        originalTitle?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 5.0)
        
        originalTitle?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        originalTitle?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        
        language?.autoPinEdge(.top, to: .bottom, of: originalTitle!, withOffset: 5.0)
        
        language?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        language?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        language?.autoSetDimension(.height, toSize: 35.0)
        
        
        extra?.autoPinEdge(.top, to: .bottom, of: poster!, withOffset: 5.0)
        
        extra?.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        extra?.autoSetDimension(.height, toSize: 18.0)
        
        extra?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        
    }
    
}

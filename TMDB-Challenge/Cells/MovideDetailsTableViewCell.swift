//
//  MovideDetailsTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class MovideDetailsTableViewCell: UITableViewCell {
    
    var poster:UIImageView?
    
    var title:UILabel?
    
    var originalTitle:UILabel?
    
    var releaseDate:UILabel?
    
    var movie:Movie?{
        
        didSet{
            
            title?.text = movie?.title ?? ""
            
            originalTitle?.text = movie?.originalTitle ?? ""
            
            releaseDate?.text = movie?.releaseDate ?? ""
            
            poster?.image = UIImage(named: "no-image")
            
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
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func createViews(){
        
        self.backgroundColor = .black
        
        let emptyImage = UIImage(named: "no-image")
        
        poster = UIImageView(image: emptyImage)
        
        poster?.contentMode = .scaleAspectFit
        
        self.addSubview(poster!)
        
        
        title = UILabel()
        
        title?.font = UIFont.systemFont(ofSize: 26.0)
        
        title?.textColor = UIColor.white
        
        title?.numberOfLines = 3
        
        self.addSubview(title!)
        
        
        originalTitle = UILabel()
        
        originalTitle?.font = UIFont.italicSystemFont(ofSize: 14.0)
        
        originalTitle?.textColor = UIColor.lightGray
        
        originalTitle?.numberOfLines = 3
        
        self.addSubview(originalTitle!)
        
        
        releaseDate = UILabel()
        
        releaseDate?.font = UIFont.systemFont(ofSize: 14.0)
        
        releaseDate?.textColor = Colors.mainColor
        
        releaseDate?.numberOfLines = 1
        
        self.addSubview(releaseDate!)
        
        
//        language = UILabel()
//
//        language?.font = UIFont.systemFont(ofSize: 13.0)
//
//        language?.textColor = UIColor.lightGray
//
//        self.addSubview(language!)
//
//
//        extra = UILabel()
//
//        extra?.font = UIFont.systemFont(ofSize: 11.0)
//
//        extra?.textColor = Colors.mainColor
//
//        extra?.textAlignment = .center
//
//        self.addSubview(extra!)
        
        
        self.accessoryType = .none
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        let imageHeight:CGFloat = CGFloat(105.0)
        
        let scaleFactor:CGFloat = CGFloat(0.7118)
        
        poster?.autoPinEdge(.top, to: .top, of: self, withOffset: 18.0)
        
        poster?.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        poster?.autoSetDimension(.height, toSize: imageHeight)
        
        poster?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 10.0)
        
        title?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        
        originalTitle?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 5.0)
        
        originalTitle?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        originalTitle?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        
        releaseDate?.autoPinEdge(.top, to: .bottom, of: originalTitle!, withOffset: 25.0)
        
        releaseDate?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        releaseDate?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        
//        language?.autoPinEdge(.top, to: .bottom, of: originalTitle!, withOffset: 5.0)
//
//        language?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
//
//        language?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
//
//        language?.autoSetDimension(.height, toSize: 35.0)
//
//
//
//        extra?.autoPinEdge(.top, to: .bottom, of: poster!, withOffset: 5.0)
//
//        extra?.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
//
//        //extra?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
//
//        extra?.autoSetDimension(.height, toSize: 18.0)
//
//        extra?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        //language?.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -5.0)
        
        //        status?.autoPinEdge(.top, to: .bottom, of: language!, withOffset: 5.0)
        //        status?.autoPinEdge(.left, to: .left, of: self, withOffset: 85.0)
        //        status?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        //status?.autoSetDimension(.height, toSize: 35.0)
        
        //        type?.autoPinEdge(.top, to: .bottom, of: status!, withOffset: 5.0)
        //        type?.autoPinEdge(.left, to: .left, of: self, withOffset: 85.0)
        //        type?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        //type?.autoSetDimension(.height, toSize: 15.0)
        
        
    }
    
}

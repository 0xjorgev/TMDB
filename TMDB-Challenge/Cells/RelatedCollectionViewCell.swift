//
//  RelatedCollectionViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import moa

class RelatedCollectionViewCell: UICollectionViewCell {
    
    var poster:UIImageView?
    
    var title:UILabel?
    
    var movie:ReducedMovie?{
        didSet{
            
            title?.text = movie?.title ?? ""
            
            poster?.image = UIImage(named: "no-image")
            
            poster?.moa.url = "\(IMG_URL)\(movie?.posterPath ?? "")"
            
            poster?.moa.onSuccess = { image in
                return image
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    func createViews(){
        
        self.backgroundColor = .black
        
        let emptyImage = UIImage(named: "no-image")
        
        poster = UIImageView(image: emptyImage)
        
        poster?.contentMode = .scaleAspectFit
        
        self.addSubview(poster!)
        
        
        title = UILabel()
        
        title?.textAlignment = .center
        
        title?.font = UIFont.systemFont(ofSize: 14.0)
        
        title?.textColor = .white
        
        title?.numberOfLines = 3
        
        self.addSubview(title!)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        let imageHeight:CGFloat = CGFloat(120.0)
        
        let scaleFactor:CGFloat = CGFloat(0.7118)
        
        poster?.autoPinEdge(.top, to: .top, of: self, withOffset: 12.0)
        
        poster?.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        poster?.autoSetDimension(.height, toSize: imageHeight)
        
        poster?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        
        title?.autoPinEdge(.top, to: .bottom, of: poster!, withOffset: 5.0)
        
        title?.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -8.0)
        
    }
    
}

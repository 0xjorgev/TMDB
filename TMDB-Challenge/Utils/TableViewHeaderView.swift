//
//  TableViewHeaderView.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/25/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation
import UIKit
import moa

class TableViewHeaderView:UIView {
    
    var headerImage:UIImageView?
    
    var visual = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    var imageUrl:String?{
        didSet{
            
            headerImage?.image = UIImage(named: "no-image-h")
            
            headerImage?.moa.url = imageUrl
            
            headerImage?.moa.onSuccess = { image in
                return image
            }
        }
    }
    
    var imageName:String?{
        didSet{
            
            headerImage?.image = UIImage(named: imageName!)
            
        }
    }
    
    func createViews(){
        
        headerImage = UIImageView()
        
        headerImage?.contentMode = .redraw
        
        self.addSubview(headerImage!)
        
        
        visual.alpha = 0.5
        
        self.addSubview(visual)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        headerImage?.autoPinEdge(.top, to: .top, of: self, withOffset: 0.0)
        
        headerImage?.autoPinEdge(.left, to: .left, of: self, withOffset: 0.0)
        
        headerImage?.autoPinEdge(.right, to: .right, of: self, withOffset: 0.0)
        
        headerImage?.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0.0)
        
        
        //visual.autoPinEdge(.top, to: .bottom, of: headerImage!, withOffset: -40.0)
        
        visual.autoPinEdge(.left, to: .left, of: self, withOffset: 0.0)
        
        visual.autoPinEdge(.right, to: .right, of: self, withOffset: 0.0)
        
        visual.autoPinEdge(.bottom, to: .bottom, of: headerImage!, withOffset: 0.0)
        
        visual.autoSetDimension(.height, toSize: 15.0)
        
    }
}

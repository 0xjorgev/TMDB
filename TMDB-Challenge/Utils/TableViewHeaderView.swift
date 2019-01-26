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
    
    var imageUrl:String?{
        didSet{
            
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
        
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        headerImage?.autoPinEdge(.top, to: .top, of: self, withOffset: 0.0)
        
        headerImage?.autoPinEdge(.left, to: .left, of: self, withOffset: 0.0)
        
        headerImage?.autoPinEdge(.right, to: .right, of: self, withOffset: 0.0)
        
        headerImage?.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0.0)
    }
}

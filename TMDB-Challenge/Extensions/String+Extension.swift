//
//  String+Extension.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func reduceArrayToString(arr:[String]) -> String {
        
        return String(arr.reduce("", { (elem1, elem2) in
            elem1 + ", " + elem2
        }).dropFirst(2))
    }
    
    func estimateLabelHeigth(text:String?, size:CGFloat, padding:CGFloat) -> CGFloat {
        
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: (UIScreen.main.bounds.width - CGFloat(48.0)), height: CGFloat.greatestFiniteMagnitude))
        
        label.text = text
        
        label.font = UIFont.systemFont(ofSize: size)
        
        label.numberOfLines = 0
        
        label.lineBreakMode = .byWordWrapping
        
        let size = CGSize(width: (UIScreen.main.bounds.width - CGFloat(padding)), height: CGFloat.greatestFiniteMagnitude)
        
        let neededSize = label.sizeThatFits(size)
        
        return neededSize.height
    }
}

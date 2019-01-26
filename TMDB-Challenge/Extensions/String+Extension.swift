//
//  String+Extension.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

extension String {
    
    func reduceArrayToString(arr:[String]) -> String {
        
        return String(arr.reduce("", { (elem1, elem2) in
            elem1 + ", " + elem2
        }).dropFirst(2))
    }
}

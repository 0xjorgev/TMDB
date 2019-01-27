//
//  Related.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

struct Related:Decodable {
    
    let results:[ReducedMovie]?
    
    enum CodingKeys: String, CodingKey {
        
        case results
    }
}

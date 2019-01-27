//
//  Upcoming.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

struct Upcoming:Decodable {
    
    let result:[Movie]?
    
    let page:Int?
    
    let totalResults:Int?
    
    let totalPages:Int?
    
    enum CodingKeys: String, CodingKey {
        
        case page
        
        case result = "results"
        
        case totalResults = "total_results"
        
        case totalPages = "total_pages"
    }
}

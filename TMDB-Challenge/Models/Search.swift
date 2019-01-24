//
//  Search.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

struct Search:Decodable {
    
    let page:Int?
    
    let totalResult:Int?
    
    let totalPages:Int?
    
    let result:[Movie]?
    
    enum CodingKeys: String, CodingKey {
        
        case page
        
        case result = "results"
        
        case totalResult = "total_results"
        
        case totalPages = "total_pages"
        
    }
}

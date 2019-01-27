//
//  Trailer.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

struct Trailer:Decodable {
    
    let id:String?
    
    let key:String?
    
    let site:String?
    
    enum CodingKeys: String, CodingKey {
        
        case id, key, site
    }
    
}

struct Videos:Decodable {
    
    let id:Int?
    
    let result:[Trailer]?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        
        case result = "results"
    }
}

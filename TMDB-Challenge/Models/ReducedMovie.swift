//
//  ReducedMovie.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

struct ReducedMovie:Decodable {
    
    let id:Int?
    
    let title:String?
    
    let posterPath:String?
    
    enum CodingKeys: String, CodingKey {
        
        case id, title
        
        case posterPath = "poster_path"
    }
    
}

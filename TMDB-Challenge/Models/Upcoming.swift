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
    
    enum CodingKeys: String, CodingKey {
        case result = "results"
    }
}

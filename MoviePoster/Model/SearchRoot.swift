//
//  Search.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 15.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import Foundation

struct SearchRoot: Codable {
    let searchResults: [SearchResult]?
    
    enum CodingKeys: String, CodingKey {
        case searchResults = "Search"
    }
}

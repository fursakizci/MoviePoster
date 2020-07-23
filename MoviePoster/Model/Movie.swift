//
//  Movie.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 23.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let poster: String
    let type: String
    let imdbID: String
    let plot: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
        case plot = "Plot"
    }
    
    var detail: [String : String] {
        [
            "Plot" : plot
        ]
    }
}

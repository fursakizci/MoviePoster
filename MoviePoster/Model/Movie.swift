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
    let released : String
    let runTime : String
    let genre : String
    let director : String
    let writer : String
    let actors : String
    let plot: String
    let language : String
    let country : String
    let awards : String
    
    let imdbID: String
    let poster: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        
        case imdbID
        case poster = "Poster"
        case type = "Type"
    }
    
    var detail: [String : String] {
        [
            "Title" : title,
            "Year" : year,
            "Released" : released,
            "Runtime" : runTime,
            "Genre" : genre,
            "Director" : director,
            "Writer" : writer,
            "Actors" : actors,
            "Plot" : plot,
            "Language" : language,
            "Country" : country,
            "Awards" : awards
        ]
    }
}

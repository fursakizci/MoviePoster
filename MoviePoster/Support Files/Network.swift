//
//  Network.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 23.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import Foundation

class Network {
    private static let baseURL = "http://www.omdbapi.com/?apikey=65f8a82"
    
    private static func request(_ url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completionHandler).resume()
    }
    
    private static func request<T: Decodable>(query:String, completion: @escaping (T?, Error?) -> Void) {
        
        let url = URL(string: "\(baseURL)\(query)")!
        
        request(url) { data, response, error in
        
            if let error = error {
                completion(nil, error)
            } else {
                do{
                    let decodable = try JSONDecoder().decode(T.self, from: data!)
                    completion(decodable, nil)
                }catch{
                    completion(nil, error)
                }
            }
        }
    }
    
    static func search(withText text: String, completion: @escaping (SearchRoot?, Error?) -> Void) {
        request(query: "&s=\(text)", completion: completion)
    }
    
    static func movieDetail(withID id: String, completion: @escaping (Movie?, Error?) -> Void) {
        request(query: "&i=\(id)", completion: completion)
    }
    
    static func getImageData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        request(url) { data, response, error in
            if let error = error {
                completion(nil, error)
            } else {
                completion(data, nil)
            }
        }
    }
}

//
//  Utilities.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 22.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import Foundation

final class Utilities{
    class func isInternetConnectionAvailable(completion: @escaping((Bool) -> Void)){
        guard let url = URL(string: "https://www.google.com")else{return}
        let task = URLSession.shared.dataTask(with: url){(data,response,error) in
            
            if let error = error{
                print("No Internet Connection Found: \(error.localizedDescription)")
                
                DispatchQueue.main.async {
                completion(false)
                }
            }
                DispatchQueue.main.async {
                completion(true)
            }
        }
        task.resume()
    }
}

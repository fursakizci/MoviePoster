//
//  UIImageView+ImageFromURL.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 23.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import UIKit

extension UIImageView {
    func image(form url: URL) {
        Network.getImageData(from: url) { data, error in
            if let error = error {
                debugPrint(error)
            } else {
                guard let imageData = data else { return }
                DispatchQueue.main.sync {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}

//
//  PosterTableViewCell.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 23.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import UIKit

final class PosterTableViewCell: UITableViewCell {
    
    private(set) lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

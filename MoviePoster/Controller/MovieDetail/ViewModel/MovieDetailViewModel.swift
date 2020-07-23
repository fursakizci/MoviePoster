//
//  MovieDetailViewModel.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 23.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import UIKit

final class MovieDetailViewModel {
    private var searchResult: SearchResult?
    private var sections: [Section]?
    
    var numberOfSection: Int? {
        return sections?.count
    }
    
    var numberOfItem: Int {
        return 1
    }
    
    var title: String? {
        searchResult?.title
    }
    
    init(searchResult: SearchResult) {
        self.searchResult = searchResult
    }
    
    func configure(_ cell: UITableViewCell, byIndex index: Int) {
        cell.textLabel?.text = sections?[index - 1].value as? String
    }
    
    func configure(_ cell: PosterTableViewCell) {
        guard let poster = searchResult?.poster, let url = URL(string: poster) else { return }
        cell.posterImageView.image(form: url)
    }
    
    func titleFor(_ section: Int) -> String? {
        if section == 0 {
            return nil
        }
        return sections?[section - 1].title
    }
    
    func fetchMovieDetail(completion: @escaping (Error?) -> Void) {
        guard let id = searchResult?.imdbID else { return }
        Network.movieDetail(withID: id) { movie, error in
            if let error = error {
                completion(error)
            }
            self.sections = movie?.detail.map { Section(title: $0.key, value: $0.value) }
            completion(nil)
        }
    }
}


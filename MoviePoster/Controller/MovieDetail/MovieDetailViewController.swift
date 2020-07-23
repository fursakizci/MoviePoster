//
//  MovieDetailViewController.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 23.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    @IBOutlet var resultTableView: UITableView!
    var movieDetailViewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = movieDetailViewModel?.title
        
        fetchMovieDetail()
        resultTableView.register(PosterTableViewCell.self, forCellReuseIdentifier: "posterCell")
    }
    
    private func fetchMovieDetail() {
        movieDetailViewModel?.fetchMovieDetail(completion: { error in
            if let error = error {
                debugPrint(error)
            } else {
                DispatchQueue.main.sync {
                    self.resultTableView.reloadData()
                }
            }
        })
    }
}

// MARK: - UITableViewDelegate
extension MovieDetailViewController: UITableViewDelegate{
    
}

// MARK: - UITableViewDataSource
extension MovieDetailViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let numberOfSection = movieDetailViewModel?.numberOfSection else { return 0 }
        return  numberOfSection + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetailViewModel?.numberOfItem ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let posterCell = tableView.dequeueReusableCell(withIdentifier: "posterCell", for: indexPath) as! PosterTableViewCell
            movieDetailViewModel?.configure(posterCell)
            return posterCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieDetailCell", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            movieDetailViewModel?.configure(cell, byIndex: indexPath.section)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        movieDetailViewModel?.titleFor(section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIScreen.main.bounds.width
        }
        return UITableView.automaticDimension
    }
}

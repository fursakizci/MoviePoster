//
//  ViewController.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 15.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import UIKit

final class MovieSearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchResults = [SearchResult]()

    
    var searchTextMovie = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        
        searchBar.delegate = self
      
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionDesignView()
    }
    
   
    
    func collectionDesignView(){
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = self.collectionView.frame.size.width
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        
        design.minimumLineSpacing = 10
        
        let cellWidth = (width - 60)
        
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.4)
        
        collectionView.collectionViewLayout = design
    }
    
    func fetchMovies(withText text:String) {
        searchResults.removeAll()
        Network.search(withText: text) { searchRoot, error in
            if let error = error {
                debugPrint(error)
            } else {
                guard let results = searchRoot?.searchResults else { return }
                
                for result in results {
                    self.searchResults.append(result)
                }
                DispatchQueue.main.sync {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = sender as? Int {
            if let vc = segue.destination as? MovieDetailViewController {
                vc.movieDetailViewModel = MovieDetailViewModel(searchResult: searchResults[index])
            }
        }
    }
}

//MARK: - SearchBarDelegate
extension MovieSearchViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        let spacelessSearchText = searchText.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        fetchMovies(withText: spacelessSearchText)
        //collectionView.reloadData()
    }
}

//MARK: - CollectionViewDataSource
extension MovieSearchViewController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        guard let url = URL(string: searchResult.poster) else { return cell }
        cell.movieImageView.image(form: url)
        
        cell.movieNameLabel.text = searchResult.title
        
        cell.movieYearLabel.text = searchResult.year
        
        return cell
    }
    
}
//MARK: - CollectionViewDelegate
extension MovieSearchViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toGoMovieDetail", sender: indexPath.row)
    }
}


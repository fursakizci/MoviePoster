//
//  SplashViewController.swift
//  MoviePoster
//
//  Created by Furkan sakızcı on 22.07.2020.
//  Copyright © 2020 Furkan sakızcı. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    let movieImage = UIImageView(image: UIImage(named: "cinema")!)
    let splashView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        splashView.backgroundColor = UIColor(red: 159/255, green: 238/255, blue: 255/255, alpha: 1.0)
        
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        movieImage.contentMode = .scaleAspectFit
        splashView.addSubview(movieImage)
        movieImage.frame = CGRect(x: splashView.frame.maxX - 254, y: splashView.frame.maxY - 500, width: 100, height: 100)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            self.scaleDownAnimation()
         
        }
    }
    func scaleDownAnimation(){
        UIView.animate(withDuration: 0.5, animations: {
            self.movieImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }){(success) in
            self.scaleUpAnimation()
        }
    }
    func scaleUpAnimation(){
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations:{
            self.movieImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }){(success) in
            self.remoteSplashScreen()
        }
    }
    
    func remoteSplashScreen(){
        splashView.removeFromSuperview()
    }
}

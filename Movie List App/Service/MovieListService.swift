//
//  MovieListService.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import UIKit

/// Service adds functionality to make any network calls
final class MovieListService: MovieListServiceProtocol {
 
    func access(_ link: String) {
        if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

//
//  Movie.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import Foundation

/// Movie data model to store the movies meta
struct Movie: Hashable {
    let id: String = UUID().uuidString
    let icon: String
    let title: String
    let description: String
    let rating: Double
    let duration: String
    let genre: String
    let releasedDate: String
    let trailerLink: String
    var isWatchlisted: Bool
    
    internal init(icon: String, title: String, description: String, rating: Double, duration: String, genre: String, releasedDate: String, trailerLink: String, isWatchlisted: Bool) {
        self.icon = icon
        self.title = title
        self.description = description
        self.rating = rating
        self.duration = duration
        self.genre = genre
        self.releasedDate = releasedDate
        self.trailerLink = trailerLink
        self.isWatchlisted = isWatchlisted
    }
}

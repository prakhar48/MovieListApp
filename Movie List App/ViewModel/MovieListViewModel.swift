//
//  MovieListViewModel.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import SwiftUI

/// Handles all data source, actions and manipulations
final class MovieListViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let service: MovieListServiceProtocol
    
    // MARK: - View rendering data
    
    @Published private(set) var movieList: [Movie] = []
    @Published private(set) var sortOptions: [SortOption] = []
    @Published private(set) var selectedMovie: Movie?
    
    // MARK: - Initializer
    
    init(service: MovieListServiceProtocol) {
        self.service = service
        setSortOptionData()
    }
    
    // MARK: - Public methods
    
    func onMovieListAppear() {
        setMovieListData()
    }
    
    func onDetail(_ movie: Movie) {
        selectedMovie = movie
    }
}

// MARK: - Private methods

extension MovieListViewModel {
    private func setMovieListData() {
        movieList = [
            Movie(
                icon: "movie1",
                title: "Tenet",
                description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
                rating: 7.8,
                duration: "2h 30 min",
                genre: "Action, Sci-Fi",
                releasedDate: "3 September 2020",
                trailerLink: "https://www.youtube.com/watch?v=LdOM0x0XDMo",
                isWatchlisted: false),
            Movie(
                icon: "movie2",
                title: "Spider-Man: Into the Spider-Verse",
                description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.",
                rating: 8.4,
                duration: "1h 57min",
                genre: "Action, Animation, Adventure",
                releasedDate: "14 December 2018",
                trailerLink: "https://www.youtube.com/watch?v=tg52up16eq0",
                isWatchlisted: false),
            Movie(
                icon: "movie3",
                title: "Knives Out",
                description: "A detective investigates the death of a patriarch of an eccentric, combative family.",
                rating: 7.9,
                duration: "2h 10min",
                genre: "Comedy, Crime, Drama",
                releasedDate: "27 November 2019",
                trailerLink: "https://www.youtube.com/watch?v=qGqiHJTsRkQ",
                isWatchlisted: false),
            Movie(
                icon: "movie4",
                title: "Guardians of the Galaxy",
                description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
                rating: 7.9,
                duration: "2h 1min",
                genre: "Action, Adventure, Comedy",
                releasedDate: "1 August 2014",
                trailerLink: "https://www.youtube.com/watch?v=d96cjJhvlMA",
                isWatchlisted: false),
            Movie(
                icon: "movie5",
                title: "Avengers: Age of Ultron",
                description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
                rating: 7.3,
                duration: "2h 21min",
                genre: "Action, Adventure, Sci-Fi",
                releasedDate: "1 May 2015",
                trailerLink: "https://www.youtube.com/watch?v=tmeOjFno6Do",
                isWatchlisted: false)
        ]
    }
    
    private func setSortOptionData() {
        sortOptions = [
            SortOption(title: "Title", type: .title),
            SortOption(title: "Released Date", type: .releaseDate)
        ]
    }
}

/* Movie list delegates */

extension MovieListViewModel: MovieListProtocol {
    /// Action performed on Sort Button click
    /// - Parameter type: Sort type
    func onSort(_ type: Sort) {
        switch type {
        case .title: movieList = movieList.sorted { $0.title < $1.title }
        case .releaseDate: movieList = movieList.sorted { $0.releasedDate < $1.releasedDate }
        }
    }
}

/* Movie Detail delegates */

extension MovieListViewModel: MovieDetailProtocol {
    /// Action on watchlit button click
    /// - Parameter id: Unique identifier
    func onWatchlist(_ id: String) {
        if let itemIndex = movieList.firstIndex(where: { $0.id == id }) {
            movieList.modifyElement(atIndex: itemIndex) { element in
                element.isWatchlisted.toggle()
                selectedMovie?.isWatchlisted = element.isWatchlisted
            }
        }
    }
    
    func onTrailer(_ link: String) {
        service.access(link)
    }
}

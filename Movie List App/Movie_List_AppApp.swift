//
//  Movie_List_AppApp.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import SwiftUI

@main
struct Movie_List_AppApp: App {
    
    var body: some Scene {
        WindowGroup {
            MovieListView(MovieListViewModel(service: MovieListService()))
        }
    }
}

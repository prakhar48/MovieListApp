//
//  MovieListView.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel: MovieListViewModel
    @State private var paths: [Int] = []
    
    init(_ viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        let data: [MovieList] = viewModel.movieList
        
        NavigationStack(path: $paths) {
            VStack(alignment: .leading, spacing: 0) {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(data, id: \.self) { movie in
                        VStack(spacing: 0) {
                            HStack(alignment: .center, spacing: 20.0) {
                                Image(movie.icon)
                                    .resizable()
                                    .frame(width: 100.0, height: 150.0)
                                    .cornerRadius(6.0)
                                    .shadow(radius: 6.0, x: 5, y: 5)
                                
                                VStack(alignment: .leading, spacing: 6.0) {
                                    Text(movie.title + " (" + (movie.releasedDate.components(separatedBy: " ").last ?? "") + ")")
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16))
                                    
                                    Text(movie.duration + " - " + movie.genre)
                                        .foregroundColor(.gray).opacity(0.80)
                                        .font(.system(size: 14))
                                    
                                    Spacer().frame(height: 18.0)
                                    
                                    if movie.isWatchlisted {
                                        Text("On my watchlist".uppercased())
                                            .foregroundColor(.black)
                                            .font(.system(size: 12))
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            Spacer().frame(height: 20.0)
                            
                            Separator()
                            
                            Spacer().frame(height: 20.0)
                        }
                        .onTapGesture {
                            paths.append(1)
                            viewModel.onDetail(movie.id)
                        }
                    }
                    .navigationDestination(for: Int.self) { int in
                        MovieDetailView(viewModel)
                    }
                }
            }
            .padding(.horizontal, 20.0)
            .navigationTitle("Movies")
            .toolbar {
                SortButtonView(delegate: viewModel, options: viewModel.sortOptions)
            }
        }
        .accentColor(.black)
        .onAppear {
            viewModel.onMovieListAppear()
        }
    }
}

//struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView(MovieListViewModel(service: MovieListService()))
//    }
//}

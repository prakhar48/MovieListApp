//
//  MovieDetailView.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import AVKit
import SwiftUI

struct MovieDetailView: View {
    @ObservedObject private var viewModel: MovieListViewModel
    @State private var pathNews: [Int] = []
    
    init(_ viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if let data: Movie = viewModel.selectedMovie {
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    Divider()
                    
                    Spacer().frame(height: 12.0)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        InfoSubview(data: data, delegate: viewModel)
                        
                        DescriptionSubview(data.description)
                        
                        DetailSubView(genre: data.genre, releasedDate: data.releasedDate)
                    }
                    .padding(.horizontal, 20.0)
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        } else {
            EmptyView()
        }
    }
}

struct InfoSubview: View {
    private let data: Movie
    private let delegate: MovieDetailProtocol
    
    init(data: Movie, delegate: MovieDetailProtocol) {
        self.data = data
        self.delegate = delegate
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 20.0) {
                Image(data.icon)
                    .resizable()
                    .frame(width: 135.0, height: 220.0)
                    .cornerRadius(6.0)
                    .shadow(radius: 6.0, x: 5, y: 5)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Spacer().frame(height: 15.0)

                    HStack(spacing: 0) {
                        Text(data.title)
                            .font(.system(size: 18.0))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        HStack(alignment: .lastTextBaseline, spacing: 0) {
                            Text(String(data.rating))
                                .font(.system(size: 18.0))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("/10")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                    }
                    
                    Spacer().frame(height: 25.0)
                    
                    Button {
                        delegate.onWatchlist(data.id)
                    } label: {
                        Text((data.isWatchlisted ? "Remove from Watchlist" : "+ Add to Watchlist").uppercased())
                            .font(.system(size: 12.0))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(.gray).opacity(0.3)
                    .frame(height: 30.0)
                    .clipShape(Capsule())
                    
                    Spacer().frame(height: 25.0)
                    
                    Button {
                        delegate.onTrailer(data.trailerLink)
                    } label: {
                        Text("Watch Trailer".uppercased())
                            .font(.system(size: 12.0))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(height: 30.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(Color.black, lineWidth: 1.0)
                    )
                    
                    Spacer()
                }
            }
            
            Separator()
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct DescriptionSubview: View {
    private let description: String
    
    init(_ description: String) {
        self.description = description
    }
    
    var body: some View {
        Text("Short Description")
            .font(.system(size: 16.0))
            .fontWeight(.medium)
            .foregroundColor(.black)
        
        Spacer().frame(height: 10.0)
        
        Text(description)
            .lineSpacing(2.5)
            .font(.system(size: 12.0))
            .foregroundColor(.gray).opacity(0.8)
        
        Separator()
    }
}

struct DetailSubView: View {
    private let genre: String
    private let releasedDate: String
    
    init(genre: String, releasedDate: String) {
        self.genre = genre
        self.releasedDate = releasedDate
    }
    
    var body: some View {
        Text("Details")
            .font(.system(size: 16.0))
            .fontWeight(.medium)
            .foregroundColor(.black)
        
        Spacer().frame(height: 10.0)
        
        HStack(spacing: 10.0) {
            VStack(alignment: .trailing, spacing: 6.0) {
                Text("Genre")
                Text("Released Date")
            }
            .font(.system(size: 12.0))
            .foregroundColor(.black)
            
            VStack(alignment: .leading, spacing: 6.0) {
                Text(genre)
                Text(releasedDate)
            }
            .font(.system(size: 12.0))
            .foregroundColor(.gray).opacity(0.8)
        }
    }
}

//
//  MovieDetailView.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 28/08/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject private var viewModel: MovieListViewModel
    
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
        Separator()
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

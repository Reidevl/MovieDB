//
//  MainPosterView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct MainPosterView: View {
    @State var movie: MovieResult
    
    var body: some View {
        
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
            image
                .resizable()
        } placeholder: {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                ProgressView()
            }
        }
        .frame(width: 250, height: 380)
        .scaledToFit()
        .cornerRadius(16)
        .clipped()
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

#Preview {
    let exampleMovie = MovieExampleData.exampleMovies[0]
    
    return Group{
        MainPosterView(movie: exampleMovie)
    }
}

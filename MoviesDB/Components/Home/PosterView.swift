//
//  PosterView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct PosterView: View {
    var movie: MovieResult
    
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
        .frame(width: 110, height: 150)
        .scaledToFit()
        .cornerRadius(16)
        .clipped()
        .padding(.horizontal, 3)
    }
}

#Preview {
    let movieExample = MovieExampleData.exampleMovies[0]
    
    return Group {
        PosterView(movie: movieExample)
    }
}

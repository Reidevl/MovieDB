//
//  DetailPoster.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 18/7/24.
//

import SwiftUI

struct DetailPoster: View {
    var movie: MovieDetail
    
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
        .frame(maxWidth: .infinity, maxHeight: 650)
        .scaledToFit()
        .cornerRadius(16)
        .clipped()
        .padding(.bottom, 15)
    }
}

#Preview {
    let movieDetailExample = MovieDetailExampleData.movieDetailExample
    return Group {
        DetailPoster(movie: movieDetailExample)
    }
}

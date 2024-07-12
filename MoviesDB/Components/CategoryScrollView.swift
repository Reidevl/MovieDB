//
//  CategoryScrollView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct CategoryScrollView: View {
    var movies: [MovieResult]?
    var isLoading: Bool
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
                .foregroundStyle(.black.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                if isLoading {
                    ProgressView("Cargando...")
                } else {
                    LazyHStack {
                        ForEach(movies ?? []) { movie in
                            PosterView(movie: movie)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    let exampleMovies = MovieExampleData.exampleMovies
    
    return Group {
        CategoryScrollView(movies: exampleMovies, isLoading: false, title: "Popular")
    }
}

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
                    VStack {
                        LazyHStack {
                            ForEach(movies ?? [], id: \.id) { movie in
                                NavigationLink(destination: DetailView(movieId: movie.id)) {
                                    PosterView(movie: movie)
                                }
                            }
                        }
                        
                    }
                }
            }
            VStack{
                NavigationLink(destination: Text("Hola")) {
                    Text("See more...")
                        .font(.title3)
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            
        }
    }
}

#Preview {
    let exampleMovies = MovieExampleData.exampleMovies
    
    return Group {
        CategoryScrollView(movies: exampleMovies, isLoading: false, title: "Popular")
    }
}

//
//  DetailView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct DetailView: View {
    @State private var hvm: HomeViewModel = .init()
    
    var movieId: Int
    
    var body: some View {
        ZStack {
            ScrollView {
                if let movieDetail = hvm.movieDetail {
                    DetailPoster(movie: movieDetail)
                    
                    VStack{
                        DetailInfo(movie: movieDetail)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(hvm.movieCredit?.cast ?? [], id: \.castID) { actor in
                                    ActorCard(actor: actor)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                } else {
                    VStack {
                        ProgressView("Cargando...")
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            Task {
                await hvm.getMovieById(movieId: movieId)
            }
        }
        .navigationTitle(hvm.movieDetail?.originalTitle ?? "Movie")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    DetailView(movieId: 1022789)
}

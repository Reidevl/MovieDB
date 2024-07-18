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
                    
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieDetail.posterPath)")) { image in
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
                    
                    VStack{
                        VStack {
                            Text(movieDetail.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .bold()
                            
                            HStack {
                                HStack {
                                    Image(systemName: "star")
                                    Text("\(Int(movieDetail.voteAverage))")
                                    
                                }
                                Text("- \(movieDetail.genreNames)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        VStack {
                            Text("Overview")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .bold()
                            
                            Text(movieDetail.overview)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.vertical, 6)
                        
                        VStack {
                            Text("Budget")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .bold()
                            
                            Text(movieDetail.budget.formatted(.currency(code: "USD")))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.vertical, 6)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(hvm.movieCredit?.cast ?? []) { actor in
                                    HStack {
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(actor.profilePath!)")) { image in
                                            image
                                                .resizable()
                                        } placeholder: {
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.gray.opacity(0.3))
                                                
                                                ProgressView()
                                            }
                                        }
                                        .frame(width: 50, height: 60)
                                        .scaledToFit()
                                        .cornerRadius(16)
                                        .clipped()
                                        
                                        VStack {
                                            Text("\(actor.name)")
                                                .font(.title2)
                                                .bold()
                                            Text("\(actor.character ?? "N/A")")
                                                .font(.title3)
                                        }
                                        .padding(.vertical)
                                    }
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

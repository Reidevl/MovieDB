//
//  DetailInfo.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 18/7/24.
//

import SwiftUI

struct DetailInfo: View {
    var movie: MovieDetail
    
    var body: some View {
        VStack {
            Text(movie.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .bold()
            
            HStack {
                HStack {
                    Image(systemName: "star")
                    Text("\(Int(movie.voteAverage))")
                    
                }
                Text("- \(movie.genreNames)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
        VStack {
            Text("Overview")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .bold()
            
            Text(movie.overview)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.vertical, 6)
        
        VStack {
            Text("Budget")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .bold()
            
            Text(movie.budget.formatted(.currency(code: "USD")))
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.vertical, 6)
    }
    
}

#Preview {
    let movieDetailExample = MovieDetailExampleData.movieDetailExample
    return Group {
        DetailInfo(movie: movieDetailExample)
    }
}

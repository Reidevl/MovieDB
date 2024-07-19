//
//  ActorCard.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 18/7/24.
//

import SwiftUI

struct ActorCard: View {
    var actor: Cast
    
    var body: some View {
        HStack {
            let actorImageURL = actor.profilePath != nil ? "https://image.tmdb.org/t/p/w500\(actor.profilePath!)" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN8TpRfeoLQp1Qkwmz5t7pskPsggM9K_Noxg&s"

            AsyncImage(url: URL(string: actorImageURL)) { image in
                image
                    .resizable()
            } placeholder: {
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                    
                    ProgressView()
                }
            }
            .frame(width: 50, height: 70)
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

#Preview {
    let exampleCast = CastExampleData.exampleCast
    return Group {
        ActorCard(actor: exampleCast[1])        
    }
}

//
//  ContentView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 11/7/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("uid") var userId: String = ""
    
    var body: some View {
        if userId == "" {
            AuthView()
        } else {
            HomeView()
                .transition(.slide)
        }
    }
}

#Preview {
    ContentView()
}

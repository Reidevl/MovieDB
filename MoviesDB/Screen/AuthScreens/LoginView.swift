//
//  LoginView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 23/7/24.
//

import SwiftUI

struct LoginView: View {
    @Binding var currentShowingView: String
    @State private var loginVM: LoginViewModel = .init()
    
    var body: some View {
        ZStack {
            Image(.loginBackground)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Welcome Back!")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                AuthContentField(currentShowingView: $currentShowingView, loginVM: $loginVM, switchViewAction: {
                    currentShowingView = "signup"
                }, title: "Login", secButtonText: "Don't have an account", mainButtonAction: loginVM.login, mainButtonText: "Sign In", mainButtonColor: Color.color1)
            }
            
        }
    }
}

#Preview {
    @State var currentView: String = "login"
    return LoginView(currentShowingView: .constant(currentView))
}

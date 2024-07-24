//
//  SignUpView.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 23/7/24.
//

import SwiftUI

struct SignUpView: View {
    @Binding var currentShowingView: String
    @State private var loginVM: LoginViewModel = .init()
    
    var body: some View {
        ZStack {
            Image(.signUpBackground)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                
                AuthContentField(currentShowingView: $currentShowingView, loginVM: $loginVM, switchViewAction: {
                    currentShowingView = "login"
                }, title: "Sign Up", secButtonText: "Already have an account?", mainButtonAction: loginVM.createAccount, mainButtonText: "Create New Account", mainButtonColor: Color.color2)
                
            }
            
        }
    }
}

#Preview {
    @State var currentView = "signup"
    return SignUpView(currentShowingView: .constant(currentView))
}

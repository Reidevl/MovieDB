//
//  AuthContentField.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 23/7/24.
//

import SwiftUI

struct AuthContentField: View {
    @Binding var currentShowingView: String
    @Binding var loginVM: LoginViewModel
    var switchViewAction: () -> Void
    
    var title: String
    var secButtonText: String
    var mainButtonAction: (String, String) -> Void
    var mainButtonText: String
    var mainButtonColor: Color
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding()
            
            EmailField(email: $loginVM.email)
            
            PasswordField(password: $loginVM.password, isValidPassword: loginVM.isValidPassword)
            
            Button {
                withAnimation {
                    switchViewAction()
                }
            } label: {
                Text(secButtonText)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.color2.opacity(0.6))
                .foregroundColor(Color.blue.opacity(0.8))
        )
        .padding()
        .shadow(radius: 10)
        
        Spacer()
        
        Button {
            withAnimation {
                mainButtonAction(loginVM.email, loginVM.password)
            }
        } label: {
            Text(mainButtonText)
                .foregroundStyle(.white)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(mainButtonColor)
                )
                .padding()
        }
        
    }
}

#Preview {
    @State var loginVM: LoginViewModel = .init()
    @State var currentShowingView: String = "login"
    
    return AuthContentField(currentShowingView: $currentShowingView, loginVM: $loginVM, switchViewAction: {
        currentShowingView = "signup"
    }, title: "Sign Up!", secButtonText: "Already have an account?", mainButtonAction: {_,_ in 
        print("test")
    }, mainButtonText: "Create New Account", mainButtonColor: Color.color2)
}

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
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Image(.signUpBackground)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                
                VStack {
                    HStack {
                        Text("Sign Up")
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
                            currentShowingView = "login"
                        }
                    } label: {
                        Text("Already have an account?")
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
                    print("hello2")
                } label: {
                    Text("Create New Account")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.color2)
                        )
                        .padding()
                }
                
            }
            
        }
    }
}

#Preview {
    @State var currentView = "signup"
    return SignUpView(currentShowingView: .constant(currentView))
}

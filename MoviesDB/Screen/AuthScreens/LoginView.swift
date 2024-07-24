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
                
                VStack {
                    HStack {
                        Text("Login")
                            .foregroundStyle(.white)
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "mail")
                            .foregroundStyle(.white)
                        VStack {
                            ZStack(alignment: .leading) {
                                if loginVM.email.isEmpty {
                                    Text("Email")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 8)
                                }
                                TextField("", text: $loginVM.email)
                                    .foregroundColor(.white)
                                    .padding(.leading, 8)
                            }
                        }
                        
                        Spacer()
                        
                        if !loginVM.email.isEmpty {
                            Image(systemName: loginVM.email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(loginVM.email.isValidEmail() ? .green : .red)
                        }
                        
                    }
                    .padding()
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                    )
                    .padding()
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundStyle(.white)
                        
                        VStack {
                            ZStack(alignment: .leading) {
                                if loginVM.password.isEmpty {
                                    Text("Password")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 8)
                                }
                                SecureField("Password", text: $loginVM.password)
                                    .foregroundColor(.white)
                                    .padding(.leading, 8)
                            }
                        }
                        
                        Spacer()
                        
                        if !loginVM.password.isEmpty {
                            Image(systemName: loginVM.isValidPassword(loginVM.password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(loginVM.isValidPassword(loginVM.password) ? .green : .red)
                        }
                    }
                    .padding()
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                    )
                    .padding()
                    
                    Button {
                        withAnimation(.bouncy) {
                            currentShowingView = "signup"
                        }
                    } label: {
                        Text("Don't have an account?")
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
                    Text("Sign In")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.color1)
                        )
                        .padding()
                }
                
            }
            
        }
    }
}

#Preview {
    @State var currentView: String = "login"
    return LoginView(currentShowingView: .constant(currentView))
}

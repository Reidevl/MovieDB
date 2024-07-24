//
//  PasswordField.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 23/7/24.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    var isValidPassword: (String) -> Bool
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .foregroundStyle(.white)
            
            VStack {
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password")
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                    }
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                }
            }
            
            Spacer()
            
            if !password.isEmpty {
                Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(isValidPassword(password) ? .green : .red)
            }
        }
        .padding()
        .overlay (
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(.white)
        )
        .padding()
    }
}

#Preview {
    func isValidPass(_ pass: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: pass)
    }
    
    return PasswordField(password: .constant("Test@123"), isValidPassword: isValidPass)
}

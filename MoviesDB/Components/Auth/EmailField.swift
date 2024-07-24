//
//  EmailField.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 23/7/24.
//

import SwiftUI

struct EmailField: View {
    @Binding var email: String
    
    var body: some View {
        HStack {
            Image(systemName: "mail")
                .foregroundStyle(.white)
            VStack {
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Email")
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                    }
                    TextField("", text: $email)
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                }
            }
            
            Spacer()
            
            if !email.isEmpty {
                Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(email.isValidEmail() ? .green : .red)
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
    EmailField(email: .constant("test@test.com"))
}

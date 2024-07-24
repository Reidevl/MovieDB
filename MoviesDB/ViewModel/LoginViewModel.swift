//
//  LoginViewModel.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 23/7/24.
//

import Foundation

@Observable
class LoginViewModel {
    var email: String = ""
    var password: String = ""
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    func login() {
        
    }
    
    func createAccount() {
        
    }
}

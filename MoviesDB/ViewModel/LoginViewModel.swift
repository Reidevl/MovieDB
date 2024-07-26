//
//  LoginViewModel.swift
//  MoviesDB
//
//  Created by Reiwil Lugo on 23/7/24.
//

import Foundation
import FirebaseAuth

@Observable
class LoginViewModel {
    var userId: String {
        get {
            UserDefaults.standard.string(forKey: "uid") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "uid")
        }
    }

    var email: String = ""
    var password: String = ""
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    func login(email: String, passw: String) {
        Auth.auth().signIn(withEmail: email, password: passw) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let authResult = authResult {
                self.userId = authResult.user.uid
            }
        }
    }
    
    func createAccount(email: String, passw: String) {
        Auth.auth().createUser(withEmail: email, password: passw) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let authResult = authResult {
                self.userId = authResult.user.uid
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.userId = ""
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

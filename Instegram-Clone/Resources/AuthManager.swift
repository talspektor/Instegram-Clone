//
//  AuthManager.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 18/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import Foundation
import FirebaseAuth

public class AuthManager {
 
    static let shared = AuthManager()
    
    // MARK: Public
    
    public func registerNewEmail(userName: String, email: String, password: String) {
        
    }
    
    public func loginUser(userName: String?, email: String?, password: String, completion: @escaping (Bool) -> (Void)) {
        if let email = email {
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { (authRresult, error) in
                guard authRresult != nil, error == nil else { return }
                completion(false)
            }
        } else if let userName = userName {
            // username login
            print(userName)
        }
    }

}

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
    
    public func registerNewEmail(userName: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - check if username if available
         - CHECK IF eimal is available
         
         */
        DatabaseManager.shared.canCreateUser(with: email, username: userName) { canCreate in
            if canCreate {
                /*
                 - create account
                 - Insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        // Firebase auth could not create account
                        completion(false)
                        return
                    }
                    // insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: userName) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // fail to insert to database
                            completion(false)
                            return
                        }
                    }
                }
                
            } else {
                completion(false)
            }
        }
    }
    
    public func loginUser(userName: String?, email: String?, password: String, completion: @escaping (Bool) -> (Void)) {
        if let email = email {
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { (authRresult, error) in
                guard authRresult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let userName = userName {
            // username login
            print(userName)
        }
    }
    
    /// Attempt to log out firebase user
    func logedOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}

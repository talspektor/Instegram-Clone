//
//  DataManager.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 18/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public

    /// Check if userbname and email are nil
    /// - Parameters:
    ///   - email: String representing email
    ///   - username: String representing username
    ///   - completion: get boolean
    public func canCreateUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Insert new user data to database
    /// - Parameters:
    ///   - email: String representing email
    ///   - username: String representing username
    ///   - completio: Async callback for result if database entery succededa
    public func insertNewUser(with email: String, username: String, completio: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeded
                completio(true)
                return
            } else {
                // failed
                completio(false)
                return
            }
        }
    }
}

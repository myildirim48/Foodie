//
//  AuthenticationManager.swift
//  FoodieApp
//
//  Created by YILDIRIM on 18.06.2023.
//

import Foundation
import Firebase

protocol AuthenticationManagerProtocol {
    func createUser(email: String, password: String, name: String) async throws
    func login(email: String, password: String) async throws
}

class AuthenticationManager: AuthenticationManagerProtocol {
    
    var userIn = false

    func createUser(email: String, password: String, name: String) async throws {
        do {
            let authDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = authDataResults.user
            let userModel = User(name: name, email: email)
            guard let encodedUser = try? Firestore.Encoder().encode(userModel) else { return }
            try await Firestore.firestore().collection("users").document(user.uid).setData(encodedUser)
            userIn = true
        } catch {
            print("DEBUG: Error while creating or saving user.")
            userIn = false
        }

    }
    
    func login(email: String, password: String) async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            userIn = true
        } catch {
            print("Error while loggin")
            userIn = false
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            userIn = true
        } catch {
            userIn = false
        }
    }
}

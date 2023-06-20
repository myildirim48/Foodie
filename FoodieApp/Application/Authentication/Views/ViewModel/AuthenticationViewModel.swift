//
//  AuthenticationViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 19.06.2023.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var showLoading = false
    
    let authService: AuthenticationManager
    
    init(authService: AuthenticationManager) {
        self.authService = authService
        
    }
    
    func signIn(escaping: @escaping(Bool) -> Void) {
        guard !email.isEmpty, !password.isEmpty, !name.isEmpty else {
            print("No email or password, name found.")
            return
        }
        
 
        Task {
          try await authService.createUser(email:email,password: password, name: name)
            escaping(authService.userIn)
    
            print("DEBUG: User sign in : \(authService.userIn)")
        }
    }
    
    func login(escaping: @escaping(Bool)-> Void) {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password, name found.")
            return
        }
        
            showLoading.toggle()
        
        Task {
            try await authService.login(email:email, password:password)
            escaping(authService.userIn)
            showLoading.toggle()
            print("DEBUG: User logged in : \(authService.userIn)")
        }
    }
}

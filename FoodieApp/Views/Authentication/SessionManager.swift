//
//  SessionManager.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import Foundation
final class SessionManager: ObservableObject {
    
    enum UserDefaultKeys {
        static let hasSeenOnboarding = "hasSeenOnboarding"
    }
    
    enum CurrentState {
        case loggedIn
        case loggedOut
        case onboarding
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func signIn() {
        currentState = .loggedIn
    }
    
    func logOut() {
        currentState = .loggedOut
    }
    
    func completeOnboarding() {
        currentState = .loggedOut
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.hasSeenOnboarding)
    }
    
    func configureCurrentState() {
        let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: UserDefaultKeys.hasSeenOnboarding)
        currentState = hasCompletedOnboarding ? .loggedOut : .onboarding
    }
}

//
//  SessionManager.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import Foundation
import FirebaseAuth

final class SessionManager: ObservableObject {
    
    enum UserDefaultKeys {
        static let hasSeenOnboarding = "hasSeenOnboarding"
        static let userHasBeenLoggedInOrSıgnedUp = "userHasBeenLoggedInOrSıgnedUp"
    }
    
    enum CurrentState {
        case loggedIn
        case loggedOut
        case onboarding
        case signUp
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func signIn() {
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.userHasBeenLoggedInOrSıgnedUp)
        currentState = .loggedIn
    }
    
    func logOut() {
        try? Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: UserDefaultKeys.userHasBeenLoggedInOrSıgnedUp)
        currentState = .loggedOut
    }
    
    func completeOnboarding() {
        currentState = .signUp
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.hasSeenOnboarding)
    }
    
    func configureCurrentState() {
        let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: UserDefaultKeys.hasSeenOnboarding)
        let hasCompletedLogin = UserDefaults.standard.bool(forKey: UserDefaultKeys.userHasBeenLoggedInOrSıgnedUp)

        if hasCompletedOnboarding {
            currentState = .signUp
//            UserDefaults.standard.set(false, forKey: UserDefaultKeys.hasSeenOnboarding)
        } else if hasCompletedLogin {
            currentState = .loggedIn
        } else {
            currentState = .onboarding
        }
    }
}

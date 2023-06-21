//
//  ContentView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var session: SessionManager
    @StateObject var authManager = AuthenticationViewModel(authService: AuthenticationManager())
    var body: some View {
        ZStack {
            switch session.currentState {
            case .loggedIn:
                TabBar()
                    .transition(.opacity)
                    .environmentObject(session)
                    .environmentObject(authManager)
            case .loggedOut:
                LoginView()
                    .transition(.opacity)
                    .environmentObject(authManager)
            case .onboarding:
                OnboardingView { showLogin in
                    if showLogin {
                        session.completeOnboarding()
                    }
                }
                .transition(.asymmetric(insertion: .opacity,
                                        removal: .move(edge: .leading)))
            case .signUp:
//                RegisterationView()
                LoginView()
                    .environmentObject(authManager)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
            default:
                Color.white.ignoresSafeArea()
            }
        }
        .animation(.easeInOut, value: session.currentState)
        .onAppear {
            session.configureCurrentState()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

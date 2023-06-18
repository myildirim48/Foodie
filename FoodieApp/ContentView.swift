//
//  ContentView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var session: SessionManager
    var body: some View {
        ZStack {
            switch session.currentState {
            case .loggedIn:
                LoginView()
                    .transition(.opacity)
            case .loggedOut:
                LoginView()
                    .transition(.opacity)
            case .onboarding:
                OnboardingView { showLogin in
                    if showLogin {
                        session.completeOnboarding()
                    }
                }
                .transition(.asymmetric(insertion: .opacity,
                                        removal: .move(edge: .leading)))
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

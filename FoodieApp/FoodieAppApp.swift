//
//  FoodieAppApp.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI

@main
struct FoodieAppApp: App {
    @StateObject private var sesssion = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sesssion)
        }
    }
}

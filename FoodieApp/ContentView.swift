//
//  ContentView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var currentStep = 0
    var body: some View {
        OnboardingView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

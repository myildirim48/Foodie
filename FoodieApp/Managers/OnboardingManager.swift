//
//  OnboardingManager.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id: Int
    let image: String
    let title: String
    let description: String
}


final class OnboardingManager: ObservableObject {
    @Published private(set) var items: [OnboardingItem] = []
    
    func load() {
        items = [
            OnboardingItem(id: 1, image: "onboarding2",
                           title: "Choose your favorite food listing.",
                           description: "We have many choise for you go and select what your want."),
            OnboardingItem(id: 2, image: "onboarding3",
                           title: "Best food delivery your favorite food.",
                           description: "We provide best product to our coustomar helthy and hygienic served food."),
            OnboardingItem(id: 3, image: "onboarding4",
                           title: "Pickup Delivery at Your Door.",
                           description: "Our app can send you everywhere, even space. For only $2.99 per month")
        ]
    }
}

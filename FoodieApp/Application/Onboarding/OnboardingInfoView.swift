//
//  OnboardingInfoView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI

struct OnboardingInfoView: View {
    let item : OnboardingItem
    var body: some View {
        VStack(spacing: 0) {
            Image(item.image)
                .resizable()
                .renderingMode(.original)
                .frame(width: 375, height: 375)
                .padding(.top, -80)
            
            VStack {
                Text(item.title)
                    .font(.system(size: 30, weight: .heavy))
                    .frame(width: 350, height: 100, alignment: .center)

                Text(item.description)
                    .font(.system(size: 20, weight: .light))
                    .padding(.top,5)
                
            }.multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct OnboardingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInfoView(item: .init(id:0,image: "onboarding2", title: "Choose yout test title", description: "This is a test description"))
    }
}

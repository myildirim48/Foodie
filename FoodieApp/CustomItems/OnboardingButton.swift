//
//  OnboardingButton.swift
//  FoodieApp
//
//  Created by YILDIRIM on 17.06.2023.
//

import SwiftUI

struct OnboardingButton: View {
    @State var double = 0.0
    let action: () -> Void
    
    var body: some View {
        
        Button {
            double += 0.25
            action()
        } label: {
           Image(systemName: "arrow.right")
                .resizable()
                .frame(width: 35, height: 30)
                .foregroundColor(.white)
                .bold()
                .rotationEffect(.degrees(45))
                .frame(width: 90, height: 90)
                .background(Color.black)
                .cornerRadius(10)
                
                          
        }.overlay(
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: double)
                .stroke(.black, lineWidth: 2)
                .padding(-7)
                
        )
        .padding()
            .rotationEffect(.degrees(-45))
            .onAppear(perform: {
                double += 0.25
            })
            .animation(.easeIn(duration: 1), value: double)
            
            
    }
}

//struct OnboardingButton_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingButton()
//    }
//}

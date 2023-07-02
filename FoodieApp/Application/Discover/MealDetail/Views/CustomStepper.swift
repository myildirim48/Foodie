//
//  CustomStepper.swift
//  FoodieApp
//
//  Created by YILDIRIM on 2.07.2023.
//

import SwiftUI

struct CustomStepper<Label: View>: View {
    @Binding var value: Int
    var range: ClosedRange<Int> // todo
    @ViewBuilder var label: Label
    
    var body: some View {
        HStack {
            label
                .font(.custom(CustomFont.semiBold, size: 24))
            
            Spacer()
            HStack {
                Button("-") { if value != range.lowerBound { value -= 1 } }
                    
                Spacer()
                Text(value.formatted())
                Spacer()
                Button("+") { if value != range.upperBound { value += 1 }  }
            }.padding()
            .font(.custom(CustomFont.semiBold, size: 20))
            .frame(width: 120, height: 44)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.secondary.opacity(0.1))
            }
        }.padding()
        .buttonStyle(.borderless)
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepper(value: .constant(0), range: 0...10) {
            Text("Salad")
        }
    }
}

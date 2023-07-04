//
//  CartCardView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 5.07.2023.
//

import SwiftUI

struct CartCardView: View {
    @State var quantity: Int = 1

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.1), radius: 10 ,x: 5,y: 10)
            
            HStack {

                Image("salad")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text("Salad")
                         .font(.custom(CustomFont.semiBold, size: 14))
                    
                    Text("Fresh Salad")
                         .font(.custom(CustomFont.regular, size: 14))
                         .foregroundColor(.gray)
                    
                    Text("$12.90")
                         .font(.custom(CustomFont.semiBold, size: 14))
                    
                }.padding()
                
                CustomStepper(value: $quantity, range: 0...10) { }
            }
        }.frame(width: 350, height: 100)
            .padding(5)

    }
}

struct CartCardView_Previews: PreviewProvider {
    static var previews: some View {
        CartCardView()
            
    }
}

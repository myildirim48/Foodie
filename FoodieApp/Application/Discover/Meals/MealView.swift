//
//  MealView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 27.06.2023.
//

import SwiftUI

struct MealView: View {
    
    var body: some View {
        VStack{
            Text("Pakistani Food")
                .bold()
                .padding(10)
                .lineLimit(3)
            
            LoadableImage(url: "https://www.themealdb.com/images/media/meals/sxwquu1511793428.jpg")
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .padding(5)
            
            HStack {
//                Price
                Text("$12")
                    .font(.system(size: 20,weight: .bold))
                +
                Text(".99")
                    .font(.system(size: 16,weight: .bold))
                    .foregroundColor(.gray)      
//                add to cart button
                Button {
//                    TODO: add to cart
                } label: {
                    VStack {
                        Image("IconsCart")
                            .scaledToFill()
                    }.frame(width: 30, height: 30)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.leading, 20)
                }
            }.padding(5)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
            .previewLayout(.sizeThatFits)
    }
}

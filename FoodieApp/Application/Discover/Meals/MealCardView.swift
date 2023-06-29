//
//  MealCardView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 27.06.2023.
//

import SwiftUI

struct MealCardView: View {
    
    @State var meal: Meal
    var body: some View {
//        let price = meal.price.splitIntoParts(decimalPlaces: 2, round: true)

        VStack{
            Text(meal.strMeal)
                .bold()
                .lineLimit(3)
            
            LoadableImage(url: meal.strMealThumb)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            
            HStack {
//                Price
                Text("$\(meal.price.leftPart)")
                    .font(.system(size: 20,weight: .bold))
                +
                Text(".\(meal.price.rightPart)")
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
                    .padding(.leading, 15)
                }
            }
        }.padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealCardView(meal: .init(strMeal: "Mokoko Food", strMealThumb: "https://www.themealdb.com/images/media/meals/sxwquu1511793428.jpg", id: "123"))
            .previewLayout(.sizeThatFits)
    }
}

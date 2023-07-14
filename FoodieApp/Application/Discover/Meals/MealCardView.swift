//
//  MealCardView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 27.06.2023.
//

import SwiftUI

struct MealCardView: View {
    
    @State var meal: MealCategories
    @StateObject private var viewModel = MealCardViewModel()
    
    var body: some View {

        VStack{
            Text(meal.strMeal)
                .font(.custom(CustomFont.semiBold,size: 16))
                .lineLimit(3)
            
            LoadableImage(url: meal.strMealThumb)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            
            HStack {
//                Price
                Text("$\(meal.priceUI().leftPart)")
                    .font(.custom(CustomFont.semiBold,size: 20))
                +
                Text(".\(meal.priceUI().rightPart)")
                    .font(.custom(CustomFont.semiBold,size: 16))
                    .foregroundColor(.gray)
//                add to cart button
                Button {
//                    TODO: add to cart
                    viewModel.addToCart(meal: meal)
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
        MealCardView(meal: FilterMealModel.mockMeal)
            .previewLayout(.sizeThatFits)
    }
}

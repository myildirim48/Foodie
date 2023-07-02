//
//  MealDetailView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 1.07.2023.
//

import SwiftUI

struct MealDetailView: View {
    @State private var selectedPortion: PortionButtonViewModel = .small
    @State private var quantity: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                headerView
                
                ScrollView {
                    
                    imageView
                    portionButtons
                    CustomStepper(value: $quantity, range: 0...10) {
                        Text("Salad")
                    }
                    
                     infoAreaCategory
                    
                    ingradientsView
                    aboutMeal
                }
            }
            addToCart
        }
        
        
    }
    var headerView: some View {
        HStack {
            //                Back button
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.clear)
                    .overlay {
                        Image("arrow")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(180))
                            .frame(width: 20, height: 15)
                            .padding(6)
                    }
                    .background(.white)
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.2), radius: 4)
            }
            
            //                Title
            Text("Details")
                .font(.custom(CustomFont.semiBold,size: 24))
                .padding(.leading,24)
            Spacer()
            
            //                Favorite button
            Button {
                
            } label: {
                
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.clear)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 16)
                            .padding(6)
                    }
                    .background(.white)
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.2), radius: 4)
            }
        }.padding()
    }
    var imageView: some View {
        Image("salad")
            .resizable()
            .frame(width: 240, height: 240)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
        
    }
    var portionButtons: some View {
        HStack(spacing: 20) {
            ForEach(PortionButtonViewModel.allCases, id:\.rawValue) { item in
                PortionButton(portionItem: item, selectedItem: $selectedPortion, action: {
                    selectedPortion = item
                }).padding()
            }
        }
    }
    var infoAreaCategory: some View {
        HStack(alignment: .firstTextBaseline) {
                VStack {
                    Text("Category")
                        .font(.custom(CustomFont.semiBold, size: 14))
                    
                    Text("Chicken")
                        .font(.custom(CustomFont.regular, size: 14))
                }
            Spacer()
                VStack {
                    Text("Area")
                        .font(.custom(CustomFont.semiBold, size: 14))
                    
                    Text("Japanese")
                        .font(.custom(CustomFont.regular, size: 14))
                }
            }.padding(.horizontal)
    

        
    }
    var ingradientsView: some View {
        VStack {
            HStack {
                Text("Ingradients")
                    .font(.custom(CustomFont.semiBold, size: 14))
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ingradient(text: "Pepper")
                    ingradient(text: "Shrimp")
                    ingradient(text: "Shrimp")
                    ingradient(text: "Shrimp")
                    ingradient(text: "Shrimp")
                }.padding(.horizontal,5)
            }
            
        }.padding()
    }
    fileprivate func ingradient(text: String) -> some View {
        return Text(text)
            .font(.custom(CustomFont.regular, size: 14))
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black.opacity(0.2), lineWidth: 1)
            }
    }
    var aboutMeal: some View {
        VStack(spacing: 10) {
            HStack {
                Text("About")
                    .font(.custom(CustomFont.semiBold, size: 14))
                Spacer()
            }
            
            Text("Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray. Combine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling. Meanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat. Place the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks. *Meanwhile, steam or cook the vegetables according to package directions. Add the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!")
                .font(.custom(CustomFont.regular, size: 14))
        }.padding()
    }
    var addToCart: some View {
        HStack {
            Text("$12.99")
                .font(.custom(CustomFont.semiBold, size: 24))
         
            Spacer()
            
            Button {
                
            } label: {
                Text("Add to cart")
                    .font(.custom(CustomFont.bold, size: 16))
                    .foregroundColor(.white)
                    .frame(width: 220, height: 50)
                                 .background(.black)
                                 .cornerRadius(8)
            }
            
        }
        .padding(.horizontal)
        .frame(width: 400, height: 100)
        .background(
            LinearGradient(gradient: Gradient(colors: [.white,.white,.white.opacity(0.4)]), startPoint: .bottom, endPoint: .top))
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView()
    }
}

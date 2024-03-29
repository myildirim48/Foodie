//
//  MealDetailView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 1.07.2023.
//

import SwiftUI

struct MealDetailView: View {
    @State private var selectedPortion: PortionButtonViewModel = .small
    @State private var quantity: Int = 1
    @State var meal: MealCategories
    
    @Binding var showTabbar: Bool
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = MealDetailViewModel(repository: FoodieRepositoryFactory.makeDetailRepository())
    
    private var priceSided: (leftPart: Int, rightPart: Int) {
        get {
            ((meal.price * selectedPortion.doublePrice) * Double(quantity)).splitIntoParts(decimalPlaces: 2, round: true)
        }
//        Calculating the price with portion and quantity
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack {
                headerView
                
                ScrollView {
                    
                    imageView
                    portionButtons
                    
                    CustomStepper(value: $quantity, range: 1...10) {
                        Text(viewModel.meal.name)
                    }
                    
                     infoAreaCategory
                    
                    ingradientsView
                    aboutMeal
                        .padding(.bottom,80)
                }
            }
            addToCart
        }
        .task { await viewModel.getMaealDetail(id: meal.id) }
        .onAppear { showTabbar = false }
        .navigationBarHidden(true)
    }
    var headerView: some View {
        HStack {
            //                Back button
            Button {
                showTabbar = true
                dismiss()
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
                //TODO: - Add favorites
                viewModel.addToFavorites(price: meal.price)
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
        LoadableImage(url: viewModel.meal.imgUrl)
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
                    
                    Text(viewModel.meal.category)
                        .font(.custom(CustomFont.regular, size: 14))
                }
            Spacer()
                VStack {
                    Text("Area")
                        .font(.custom(CustomFont.semiBold, size: 14))
                    
                    Text(viewModel.meal.area)
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
                    ForEach(viewModel.meal.ingreddients, id: \.self) { ingre in
                        ingradient(text: ingre)
                    }
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
            
            Text(viewModel.meal.about)
                .font(.custom(CustomFont.regular, size: 14))
        }.padding()
    }
    var addToCart: some View {
        HStack {
            
            
            Text("$\(priceSided.leftPart)")
                .font(.custom(CustomFont.semiBold,size: 24))
            +
            Text(".\(priceSided.rightPart)")
                .font(.custom(CustomFont.semiBold,size: 20))
                .foregroundColor(.gray)
            
            Spacer()
            
            Button {
                viewModel.addToCart(price: meal.price)
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
        MealDetailView(meal: MealCategories.init(id: "", strMeal: "", strMealThumb: ""),showTabbar: .constant(true))
    }
}

//
//  CartView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI
import RealmSwift

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showTabbar: Bool
    @Binding var callBack: Tab
    
    @ObservedResults(CartModel.self) var cartItems
    @StateObject private var viewModel = CartCardViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                headerview
                Spacer()
                
                if cartItems.isEmpty {
                    FoodieEmptyView(toWhere: .cart)
                    Spacer()
                } else {
                    scrollableFoodsView
                    totalPriceView
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                showTabbar = false
            }
            
        }
        .onTapGesture { showTabbar.toggle() }
    }
    //MARK: - Headerview
    var headerview: some View {
        HStack {
//            Backbutton
            Button {
                DispatchQueue.main.async {
                    showTabbar = true
                }
                callBack = .discover
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
            Text("Order Details")
                .font(.custom(CustomFont.semiBold,size: 24))
                .padding(.leading,24)
            Spacer()
        }.padding()
    }
    //MARK: - Scrollable Foods view
    var scrollableFoodsView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(cartItems) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal.convertToMealCategory(), showTabbar: $showTabbar)
                    } label: {
                        CustomSwipeCardView(meal: meal,
                                            deleteAction: { viewModel.deleteFromRealm(meal: meal) },
                                            onChange: { viewModel.calculateTotalPrice() },
                                            hasStepper: true)
                        .padding(.horizontal)
                    }

                }
            }
        }
    }
    //MARK: -  Total Price view
    var totalPriceView: some View {
        VStack {
            
            VStack {
                HStack {
                    Text("Sub Total")
                        .font(.custom(CustomFont.regular, size: 16))
                    Spacer()
                    Text( "$" + String(format: "%.2f", viewModel.totalPrice))
                        .font(.custom(CustomFont.bold, size: 16))
                }
                HStack {
                    Text("Delivery Charge")
                        .font(.custom(CustomFont.regular, size: 16))
                    Spacer()
                    Text("$3")
                        .font(.custom(CustomFont.bold, size: 16))
                }
                Divider()
                HStack {
                    Text("Total")
                        .font(.custom(CustomFont.regular, size: 16))
                    Spacer()
                    
                    Text( "$" + String(format: "%.2f", viewModel.totalPrice + 3.0))
                        .font(.custom(CustomFont.bold, size: 16))
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                
            }
            .padding()

            Button {
                //TODO: - Place my order button

            } label: {
                Text("Place my order")
                    .font(.custom(CustomFont.bold, size: 16))
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                    .background(.black)
                    .cornerRadius(8)
                    .padding(.bottom, showTabbar ? 60 : 0)
            }
            
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(showTabbar: .constant(true), callBack: .constant(.cart))
    }
}

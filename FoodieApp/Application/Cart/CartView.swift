//
//  CartView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    @State private var cartMeals = [1,2,3,4]
    var body: some View {
        VStack {
            headerview
            Spacer()
            if cartMeals.isEmpty {
                emptyView
                Spacer()
            }
            
            ScrollView(.vertical) {
                ForEach(cartMeals, id: \.self) { Int in
                    CartCardView()
                        .padding(.horizontal)
                }
            }
            
            
            
            VStack {
                
                VStack {
                    HStack {
                        Text("Sub Total")
                            .font(.custom(CustomFont.regular, size: 16))
                        Spacer()
                        Text("$10")
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
                        Text("$13")
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
                    
                } label: {
                    Text("Place my order")
                        .font(.custom(CustomFont.bold, size: 16))
                        .foregroundColor(.white)
                        .frame(width: 350, height: 50)
                                     .background(.black)
                                     .cornerRadius(8)
                }

            }
        }
    }
    
    var headerview: some View {
        HStack {
            Button {
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
            Text("Order Details")
                .font(.custom(CustomFont.semiBold,size: 24))
                .padding(.leading,24)
            Spacer()
        }.padding()
    }
    var emptyView: some View {
        VStack {
            Image("empty")
                
            
            Text("Empty")
                .font(.custom(CustomFont.semiBold, size: 24))
            
            Text("You don't have any foods in cart at this time")
                .font(.custom(CustomFont.regular, size: 14))
                .foregroundColor(.gray)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

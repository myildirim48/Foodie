//
//  MealDetailView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 1.07.2023.
//

import SwiftUI

struct MealDetailView: View {
    var body: some View {
        VStack {
            //            Header
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
            ScrollView {
                //            İmage
                Image("salad")
                    .resizable()
                    .frame(width: 240, height: 240)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
                
            }
        }
        
        
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView()
    }
}

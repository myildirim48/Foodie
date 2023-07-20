//
//  EmptyView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.07.2023.
//

import SwiftUI


enum EmptyType: String {
    case cart = "You don't have any foods in cart at this time"
    case favorites = "You don't have any foods in favorites at this time"
}
struct FoodieEmptyView: View {
    
    @State var toWhere: EmptyType
    
    var body: some View {
        
            VStack {
                Image("empty")
                
                
                Text("Empty")
                    .font(.custom(CustomFont.semiBold, size: 24))
                
                Text(toWhere.rawValue)
                    .font(.custom(CustomFont.regular, size: 14))
                    .foregroundColor(.gray)
            }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        FoodieEmptyView(toWhere: .cart)
    }
}

//
//  SideMenu.swift
//  FoodieApp
//
//  Created by YILDIRIM on 21.06.2023.
//

import SwiftUI

struct MenuItem: View {
    
    @State var category: CategoryResult
    @Binding var selectedCategory: CategoryResult?
//    var isSelected: Bool
    
    var body: some View {
        
        ZStack {
           RoundedRectangle(cornerRadius: 30)
               .frame(width: 60,height: 100)
               .foregroundColor(category == selectedCategory ? .black : .white)
            
            LoadableImage(url: category.strCategoryThumb)
               .frame(width: 50, height: 50)
               .clipShape(Circle())
               .scaledToFill()
               .offset(y: -20)
           
            Text(category.strCategory)
                .truncationMode(.tail)
                .frame(width: 50,height: 15)
                .font(.system(size: 12,weight: .medium))
               .offset(y: 20)
               .foregroundColor(category == selectedCategory ? .white : .black)
               
//               .fixedSize()
        }.padding(5)
        .cornerRadius(30)
           .shadow(color: .black.opacity(0.2), radius: 4)
           .scaleEffect(category == selectedCategory ? 1.10 : 1.0)
    }
    
}


//struct MenuItem_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuItem(category: CategoryForPreview(id: 1, name: "Salad", image: "salad"), selectedCategory: .constant(.init(id: 1, name: "Salad", image: "salad")))
//    }
//}

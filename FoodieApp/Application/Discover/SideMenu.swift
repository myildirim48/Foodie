//
//  SideMenu.swift
//  FoodieApp
//
//  Created by YILDIRIM on 21.06.2023.
//

import SwiftUI

struct Category:Identifiable, Equatable {
    let id: Int
    let name: String
    let image: String
}

//struct SideMenu: View {
//
//    let categories = [
//        Category(id: 1, name: "Dessert", image: "salad"),
//        Category(id: 2, name: "Food", image: "salad"),
//        Category(id: 3, name: "Bacon", image: "salad"),
//        Category(id: 4, name: "Kebab", image: "salad"),
//        Category(id: 5, name: "Rice", image: "salad"),
//        Category(id: 6, name: "Bacon", image: "salad"),
//        Category(id: 7, name: "Kebab", image: "salad"),
//        Category(id: 8, name: "Rice", image: "salad"),
//        Category(id: 9, name: "Bacon", image: "salad"),
//        Category(id: 10, name: "Kebab", image: "salad"),
//        Category(id: 11, name: "Rice", image: "salad"),
//        Category(id: 12, name: "Bacon", image: "salad"),
//        Category(id: 13, name: "Kebab", image: "salad"),
//        Category(id: 14, name: "Rice", image: "salad")]
//
//
//    @State var selectedCate: Category? = nil
//
//    var body: some View {
//
//                ScrollView(showsIndicators: false) {
//                    ForEach(categories) { category in
//                        MenuItem(category: category, selectedCategory: $selectedCate)
//                            .onTapGesture {
//                                withAnimation(.linear) {
//                                    selectedCate = category
//                                }
//                            }
//                        }
//                }
//    }
//}

struct MenuItem: View {
    
    @State var category: Category
    @Binding var selectedCategory: Category?
//    var isSelected: Bool
    
    var body: some View {
        
        ZStack {
           RoundedRectangle(cornerRadius: 30)
               .frame(width: 60,height: 100)
               .foregroundColor(category == selectedCategory ? .black : .white)
           
            Image(category.image)
               .resizable()
               .frame(width: 50, height: 50)
               .clipShape(Circle())
               .offset(y: -20)
           
            Text(category.name)
//                .frame(width: 50)
                .font(.system(size: 13,weight: .bold))
               .offset(y: 20)
               .foregroundColor(category == selectedCategory ? .white : .black)
        }.padding(5)
        .cornerRadius(30)
           .shadow(color: .black.opacity(0.2), radius: 4)
           .scaleEffect(category == selectedCategory ? 1.10 : 1.0)
    }
    
}


struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(category: Category(id: 1, name: "Salad", image: "salad"), selectedCategory: .constant(.init(id: 1, name: "Salad", image: "salad")))
    }
}

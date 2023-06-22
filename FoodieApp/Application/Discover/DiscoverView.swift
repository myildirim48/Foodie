//
//  DiscoverView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct DiscoverView: View {
    let categories = [
        Category(id: 1, name: "Dessert", image: "salad"),
        Category(id: 2, name: "Food", image: "salad"),
        Category(id: 3, name: "Bacon", image: "salad"),
        Category(id: 4, name: "Kebab", image: "salad"),
        Category(id: 5, name: "Rice", image: "salad"),
        Category(id: 6, name: "Bacon", image: "salad"),
        Category(id: 7, name: "Kebab", image: "salad"),
        Category(id: 8, name: "Rice", image: "salad"),
        Category(id: 9, name: "Bacon", image: "salad"),
        Category(id: 10, name: "Kebab", image: "salad"),
        Category(id: 11, name: "Rice", image: "salad"),
        Category(id: 12, name: "Bacon", image: "salad"),
        Category(id: 13, name: "Kebab", image: "salad"),
        Category(id: 14, name: "Rice", image: "salad")]

    @State var selectedCate: Category? = nil

    var body: some View {
        VStack(spacing: 0) {
            //            Header with search
            VStack(alignment: .leading) {
                Text("What would you like to order.")
                    .font(.system(size: 30, weight: .bold))
                SearchBar(searchText: .constant(""))
            }.padding()
            HStack {
                GeometryReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],spacing: 0) {
                            ForEach(0..<10) { _ in
                                    CategoryView()
                                    .frame(width: proxy.size.width * 0.40)
                                }
                        }.padding(.leading,5)

                    }
                    .padding(.top, 20)
                    .padding(.leading,10)
                    .frame(width: proxy.size.width * 0.90)
                }

                
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(categories) { category in
                            MenuItem(category: category, selectedCategory: $selectedCate)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        selectedCate = category
                                    }
                                }
                            }
                    }
                }.offset(x: -16)
            }

        }
        
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            
    }
}

//
//  SearchBar.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image("magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.secondary : .black
                )
            TextField("Search your food..", text: $searchText)
                .foregroundColor(.black)
        }.font(.callout)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.1))
                    .shadow(color: .black.opacity(0.3), radius: 10)
            )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}

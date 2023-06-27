//
//  DiscoverView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct DiscoverCategoriesView: View {

    @StateObject private var viewModel = DiscoverCategoriesViewModel(service: NetworkService())
    var body: some View {
        NavigationStack {
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
                        
                                ForEach(viewModel.categories) { category in
                                    NavigationLink {
                                        MealsView(selectedCate: category)
                                    } label: {
                                        CategoryView(category: category)
                                            .frame(width: proxy.size.width * 0.45, height: proxy.size.height * 0.30)
                                    }

                                }

                            }.padding(.horizontal,5)
                        }
                    }
                }

            }.task {
                await viewModel.getCategories()
            }
        }
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCategoriesView()

    }
}

//
//  DiscoverView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct DiscoverCategoriesView: View {

    @StateObject private var viewModel = DiscoverCategoriesViewModel(repository: FoodieMainRepository(service: NetworkService()))
    @Binding var showTabbar: Bool
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                //            Header with search
                VStack(alignment: .leading) {
                    Text("What would you like to order.")
                        .font(.custom(CustomFont.bold,size: 30))
                    SearchBar(searchText: .constant(""))
                }.padding()
                HStack {
                    GeometryReader { proxy in
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],spacing: 8) {
                        
                                ForEach(viewModel.categories) { category in
                                    NavigationLink {
                                        MealsView(selectedCate: category, showTabbar: $showTabbar)
                                    } label: {
                                        CategoryCardView(category: category)
                                            .frame(width: proxy.size.width * 0.45, height: proxy.size.height * 0.35)
                                    }
                                }

                            }.padding(.horizontal,5)
                        }
                    }
                }            .padding(.bottom, 60)


            }.task {
                await viewModel.getCategories()
            }
        }
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCategoriesView(showTabbar: .constant(true))

    }
}

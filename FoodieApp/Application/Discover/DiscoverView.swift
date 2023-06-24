//
//  DiscoverView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct DiscoverView: View {

    @State var selectedCate: CategoryResult? = nil
    @StateObject private var viewModel = DiscoverViewModel(service: NetworkService())
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
                        ForEach(viewModel.categories, id:\.self) { category in
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

        }.task {
            await viewModel.getCategories()
        }
        
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            
    }
}

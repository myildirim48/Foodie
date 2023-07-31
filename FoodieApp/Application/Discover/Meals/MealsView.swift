//
//  MealsView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 27.06.2023.
//

import SwiftUI

struct MealsView: View {
    @State var selectedCate: CategoryResult
    @StateObject private var viewModel = MealsViewModel(service: NetworkService())
    @Binding var showTabbar: Bool
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                //            Header with search
                VStack(alignment: .leading) {
                    Text("What would you like to order.")
                        .font(.custom(CustomFont.bold,size: 30))
                    SearchBar(searchText: $searchTerm)
                }.padding()
                    .onChange(of: searchTerm) { newSearchQuery in
                        viewModel.searchtext = newSearchQuery
                    }
                
                HStack {
            //        %90 left side will be with meals
                        StaggeredGrid(list: viewModel.mealSearchable, columns: 2) { meal in
                            NavigationLink {
                                MealDetailView(meal: meal,
                                               showTabbar: $showTabbar)
                            } label: {
                                MealCardView(meal: meal)
                            }
                        }.padding([.leading, .trailing], 10)
                        .padding(.bottom, 60)
              
                    //        Scrollable side menu
                    if searchTerm.isEmpty {
                        VStack {
                                ScrollView(showsIndicators: false) {
                                    ForEach(viewModel.categories, id:\.self) { category in
                                        MenuItem(category: category, selectedCategory: $selectedCate)
                                            .onTapGesture {
                                                withAnimation(.linear) {
                                                    selectedCate = category
                                                }
                                                Task {
                                                    await viewModel.getMealsByCategory(category: category.strCategory)
                                                }
                                            }
                                        }
                                }
                        }.padding(.trailing, 10)
                            .padding(.bottom, 60)
                            .task {
                                await viewModel.getMealsByCategory(category: selectedCate.strCategory)
                            }.animation(.default, value: searchTerm.isEmpty)
                    }
                }
            }.navigationBarHidden(true)
        }
        
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(selectedCate: .init(id: "", strCategory: "", strCategoryThumb: "", strCategoryDescription: ""), showTabbar: .constant(true))
    }
}

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
    var body: some View {
        NavigationStack {
            VStack {
                //            Header with search
                VStack(alignment: .leading) {
                    Text("What would you like to order.")
                        .font(.custom(CustomFont.bold,size: 30))
                    SearchBar(searchText: .constant(""))
                }.padding()
                
                HStack {
            //        %90 left side will be with meals
                        StaggeredGrid(list: viewModel.meals, columns: 2) { meal in
                            NavigationLink {
                                MealDetailView(meal: meal,
                                               showTabbar: $showTabbar)
                            } label: {
                                MealCardView(meal: meal)
                            }
                        }.padding([.leading, .trailing], 10)
                        .padding(.bottom, 60)
              
                    //        Scrollable side menu
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

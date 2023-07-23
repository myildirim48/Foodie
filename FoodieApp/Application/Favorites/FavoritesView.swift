//
//  FavoritesView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI
import RealmSwift

struct FavoritesView: View {
    @ObservedResults(RealmModel.self) var favorites
    @Binding var showTabbar: Bool

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Favorites")
                        .font(.custom(CustomFont.semiBold,size: 24))
                        .padding([.leading,.top],24)
                    Spacer()
                }
                
                if favorites.isEmpty {
                    Spacer()
                    FoodieEmptyView(toWhere: .favorites)
                    Spacer()
                } else {
                    scrollableFavoritesView
                }
            }
        }
        .onAppear { showTabbar = true }
    }
    
    var scrollableFavoritesView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(favorites) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal.convertToMealCategory(),
                                       showTabbar: $showTabbar)
                    } label: {
                        CustomSwipeCardView(meal: meal,
                                            deleteAction: { deleteFromRealm(meal: meal) })
                            .padding(.horizontal)
                    }

                }
            }
        }
    }
    func deleteFromRealm(meal: RealmModel) {
        do {
            let realm = try! Realm()
            
            guard let meal = realm.object(ofType: RealmModel.self, forPrimaryKey: meal.id) else { return }
            try realm.write({
                realm.delete(meal)
            })
        } catch {
            print("Error while deleting from realm", error.localizedDescription)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(showTabbar: .constant(true))
    }
}

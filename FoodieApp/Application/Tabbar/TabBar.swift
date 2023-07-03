//
//  HomeView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct TabBar: View {
    @State private var tabSelected: Tab = .discover
    @EnvironmentObject private var session : SessionManager
    @State private var showTabbar: Bool = true
//    init() {
//        UITabBar.appearance().isHidden = false
//    }
    
    var body: some View {
        ZStack {
            switch tabSelected {
            case .discover:
                DiscoverCategoriesView(showTabbar: $showTabbar)
            case .location:
                LocationView()
                    .environmentObject(session)
            case .cart:
                CartView()
            case .favorites:
                FavoritesView()
            case .notifications:
                NotificationView()
            }
            if showTabbar {
                VStack {
                    Spacer()
                    CustomTabbar(selectedTab: $tabSelected)
                }
            }
        }
        .animation(.easeIn, value: showTabbar)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

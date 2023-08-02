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
                    .transition(.move(edge: .leading))
            case .location:
                LocationView()
                    .transition(.move(edge: .leading))
                    .environmentObject(session)
            case .cart:
                CartView(showTabbar: $showTabbar, callBack: $tabSelected)
                    .transition(.move(edge: .leading))
            case .favorites:
                FavoritesView(showTabbar: $showTabbar)
                    .transition(.move(edge: .leading))
            case .notifications:
                NotificationView()
                    .transition(.move(edge: .leading))
            }
            if showTabbar {
                VStack {
                    Spacer()
                    CustomTabbar(selectedTab: $tabSelected)
                        .transition(.slide)
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

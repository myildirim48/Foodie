//
//  HomeView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct TabBar: View {
    @State private var tabSelected: Tab = .discover
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            switch tabSelected {
            case .discover:
                DiscoverView()
            case .location:
                LocationView()
            case .cart:
                CartView()
            case .favorites:
                FavoritesView()
            case .notifications:
                NotificationView()
            }
                VStack {
                    Spacer()
                    CustomTabbar(selectedTab: $tabSelected)
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

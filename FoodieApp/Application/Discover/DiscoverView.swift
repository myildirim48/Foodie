//
//  DiscoverView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        VStack {
            //            Header with search
            VStack(alignment: .leading) {
                Text("What would you like to order.")
                    .font(.system(size: 30, weight: .bold))
                SearchBar(searchText: .constant(""))
            }.padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(0..<10) { _ in
                            CategoryView()
                        }
                }
                }
        }
        
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            
    }
}

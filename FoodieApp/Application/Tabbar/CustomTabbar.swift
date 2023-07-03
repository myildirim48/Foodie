//
//  HomeView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 19.06.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case discover
    case location
    case cart
    case favorites
    case notifications
}
struct CustomTabbar: View {
    @Binding var selectedTab: Tab
    
     private var fillImage: String {
         selectedTab.rawValue
     }
    
    var body: some View {        
        VStack {
               HStack {
                   ForEach(Tab.allCases, id: \.rawValue) { tab in
                       Spacer()
                       Image(tab.rawValue)
                           .renderingMode(.template)
                           .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                           .foregroundColor(tab == selectedTab ? .black : .gray.opacity(0.5))
                           .onTapGesture {
                               withAnimation(.easeInOut(duration: 0.1)) {
                                   selectedTab = tab
                               }
                           }
                       Spacer()
                   }
               }
               .frame(width: nil, height: 60)
               .background(.thinMaterial)
               .cornerRadius(20)
               .padding(.horizontal)
            
        }
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar(selectedTab: .constant(.location))
    }
}

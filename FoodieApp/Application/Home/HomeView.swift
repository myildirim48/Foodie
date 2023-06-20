//
//  HomeView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 19.06.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionManager
    
    var body: some View {        
        Button {
            session.logOut()
        } label: {
            Text("Log out")
                .bold()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

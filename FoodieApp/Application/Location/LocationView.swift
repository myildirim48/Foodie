//
//  LocationView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var session: SessionManager
    

    var body: some View {
        Button("Log out") {
            session.logOut()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

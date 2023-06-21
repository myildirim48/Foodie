//
//  CategoryView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI
import Foundation

struct CategoryView: View {
    var colors: [Color] = [Color.red.opacity(0.2),
                           Color.cyan.opacity(0.2),
                           Color.green.opacity(0.2),
                           Color.yellow.opacity(0.2),
                           Color.pink.opacity(0.2),
                           Color.brown.opacity(0.2),
                           Color.blue.opacity(0.2),
                           Color.indigo.opacity(0.2),
                           Color.mint.opacity(0.2)]    
    var body: some View {
        VStack {

                VStack{
                    HStack {
                        Text("Salad")
                            .bold()
                            .padding()
                        Spacer()
                    }
                    VStack {
                        Image("salad")
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFill()
                            .offset(x: 35, y: 35)
                    }
                }
                    .background(colors.randomElement())
                    .cornerRadius(15)
                    .padding()

        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .previewLayout(.sizeThatFits)
    }
}

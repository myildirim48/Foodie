//
//  test.swift
//  FoodieApp
//
//  Created by YILDIRIM on 20.06.2023.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}
struct TestView: View {
    let categories = [
        Category(name: "Category 1", isSelected: false),
        Category(name: "Category 2", isSelected: true),
        Category(name: "Category 3", isSelected: false),
        Category(name: "Category 4", isSelected: false)
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Ellipse()
                        .fill(Color.blue)
                        .frame(width: 80, height: 120)
                    
                    Image("salad")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .offset(y: -30)
                    
                    Text("Profile")
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(y: 30)
                }
                .padding(.vertical, 16)

                List(categories) { category in
                    HStack {
                        Text(category.name)
                            .foregroundColor(category.isSelected ? .black : .white)
                        
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .background(category.isSelected ? Color.gray.opacity(0.2) : nil)
                }
                .listStyle(PlainListStyle())
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

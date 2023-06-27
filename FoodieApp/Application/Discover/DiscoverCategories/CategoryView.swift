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
    @State var category: CategoryResult

    var body: some View {
                VStack{
                    HStack {
                        Text(category.strCategory)
                            .font(.system(size: 16, weight: .bold))
                            .lineLimit(3)
                            .truncationMode(.tail)
                            .padding([.leading,.top], 10)
                        Spacer()
                    }
                    VStack {
                        LoadableImage(url: category.strCategoryThumb)
                            .clipShape(Circle())
                            .frame(width: 120, height: 120)
                            .offset(x: 30, y: 20)
                    }
                }
                    .background(colors.randomElement())
                    .cornerRadius(15)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .init(id: "52912", strCategory: "Three-cheese souffles", strCategoryThumb: "https://www.themealdb.com/images/media/meals/sxwquu1511793428.jpg", strCategoryDescription: ""))
            .previewLayout(.sizeThatFits)
    }
}

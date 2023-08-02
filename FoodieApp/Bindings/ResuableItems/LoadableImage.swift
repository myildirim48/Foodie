//
//  LoadableImage.swift
//  FoodieApp
//
//  Created by YILDIRIM on 23.06.2023.
//

import SwiftUI

struct LoadableImage: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url) ) { phase in
                     switch phase {
                     case .empty:
                         ProgressView()
                     case .success(let image):
                         image
                             .resizable()
                              .scaledToFill()
                     case .failure:
                         Image(systemName: "fork.knife.circle")
                     @unknown default:
                         // Since the AsyncImagePhase enum isn't frozen,
                         // we need to add this currently unused fallback
                         // to handle any new cases that might be added
                         // in the future:
                         EmptyView()
                     }
                 }
    }
}

struct LoadableImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImage(url: "asd")
    }
}

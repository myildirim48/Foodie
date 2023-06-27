//
//  DiscoverViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 23.06.2023.
//

import Foundation
import SwiftUI

extension DiscoverCategoriesView {
    @MainActor
    final class DiscoverCategoriesViewModel: ObservableObject {
        private var service: NetworkService
        @Published var categories: [CategoryResult] = []
        
        init(service: NetworkService) {
            self.service = service
        }
        
        func getCategories() async {
            do {
                try await categories = service.getCategories().categories
            } catch {
                //                    TODO : Show error to user
            }
        }

    }
}

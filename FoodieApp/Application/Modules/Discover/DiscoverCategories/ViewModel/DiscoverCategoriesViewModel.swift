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
        private var repository: FoodieMainRepository
        @Published var categories: [CategoryResult] = []
        
        init(repository: FoodieMainRepository) {
            self.repository = repository
        }
        
        func getCategories() async {
            do {
                try await categories = repository.getCategories().categories
            } catch {
                //                    TODO : Show error to user
            }
        }

    }
}

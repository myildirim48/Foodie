//
//  PortionButtonViewModel.swift
//  FoodieApp
//
//  Created by YILDIRIM on 2.07.2023.
//

import Foundation
enum PortionButtonViewModel: Int, CaseIterable {
    case small
    case medium
    case large
    
    var title: String {
        switch self {
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        }
    }
    
    var doublePrice: Double {
        switch self {
        case .small:
            return 1
        case .medium:
            return 1.20
        case .large:
            return 1.50
        }
    }
    
}

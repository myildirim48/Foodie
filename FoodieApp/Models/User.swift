//
//  User.swift
//  FoodieApp
//
//  Created by YILDIRIM on 19.06.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var id: String?
    let name: String
    let email: String
}

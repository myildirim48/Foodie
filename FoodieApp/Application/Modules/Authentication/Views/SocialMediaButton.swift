//
//  SocialMediaButton.swift
//  FoodieApp
//
//  Created by YILDIRIM on 18.06.2023.
//

import SwiftUI

struct SocialMediaButton: View {
    enum ImageName: String {
    case google, facebook, apple
        
        var string: String {
            switch self {
            case .apple: return "LogoApple"
            case .facebook: return "LogoFacebook"
            case .google: return "LogoGoogle"
            }
        }
    }
    let action: () -> Void
    let imageName: ImageName
    var body: some View {
        Button {
            action()
        } label: {
            Image(imageName.string)
                .frame(width: 98, height: 64)

        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.secondary, lineWidth: 1)
        )
    }
}

struct SocialMediaButton_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaButton(action: {
            
        }, imageName: .apple)
    }
}

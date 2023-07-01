//
//  CustomTextField.swift
//  FoodieApp
//
//  Created by YILDIRIM on 18.06.2023.
//

import SwiftUI

struct CustomTextField: View {
    
enum ImageName: String {
    case email,password,name
        
        var string: String {
            switch self {
            case .email: return "IconsEmail"
            case .name: return "IconsPerson"
            case .password: return "IconsLock"
            }
        }
    }
    
    @Binding var text: String
    let placeholder: String
    let imgName: ImageName
    var isSecure: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                
                Text(placeholder)
                    .font(.custom(CustomFont.regular,size: 18))
                    .foregroundColor(.secondary)
                    .padding(.leading, 30)
                    
            }
            HStack {
                Image(imgName.string)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                
                if isSecure {
                    SecureField("", text: $text)
                }else{
                    TextField("", text: $text)
                }
                
            }
        }.padding()
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.secondary, lineWidth: 1)
            )
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "Email Address", imgName: .password)
            .previewLayout(.sizeThatFits)
    }
}

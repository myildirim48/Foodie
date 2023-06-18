//
//  CustomTextField.swift
//  FoodieApp
//
//  Created by YILDIRIM on 18.06.2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imgName: String
    var isSecure: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    
                    .font(.system(size: 18, weight: .regular))
                    .padding(.leading, 30)
                    
            }
            HStack {
                Image(imgName)
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
        CustomTextField(text: .constant(""), placeholder: Text("Email Address"), imgName: "IconsLock")
    }
}

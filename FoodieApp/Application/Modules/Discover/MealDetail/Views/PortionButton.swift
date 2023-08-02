//
//  NavigateButton.swift
//  FoodieApp
//
//  Created by YILDIRIM on 2.07.2023.
//

import SwiftUI

struct PortionButton: View {
    var portionItem: PortionButtonViewModel
    @Binding var selectedItem: PortionButtonViewModel
    let action: () -> Void
    
    var body: some View {
        Button {

            action()
            
        } label: {
            
            Text(portionItem.title)
            .padding()
            .font(.custom(CustomFont.regular, size: 16))
            .frame(height: 35)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(portionItem == selectedItem ? .black : .black.opacity(0.2), lineWidth: 1)
            }
            .scaleEffect(portionItem == selectedItem ? 1.20 : 1.0)
            .animation(.easeOut, value: portionItem == selectedItem)
        }
        
    }
}

struct NavigateButton_Previews: PreviewProvider {
    static var previews: some View {
        PortionButton(portionItem: .large, selectedItem: .constant(.large)) {
            
        }
    }
}

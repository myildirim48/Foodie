//
//  CartCardView.swift
//  FoodieApp
//
//  Created by YILDIRIM on 5.07.2023.
//

import SwiftUI

struct CartCardView: View {
    @State var quantity: Int = 1
    
//    For real time update
    @State var meal: CartModel
    @State private var offset: CGFloat = 0.0
    @State private var isSwiped: Bool = false
    
    @StateObject var viewModel: CartCardViewModel
    
    var price: (leftPart: Int, rightPart: Int)  {
        get {
            (Double(quantity) * meal.price).splitIntoParts(decimalPlaces: 2, round: true)
            //        Calculating the price with portion and quantity
        }
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.1), radius: 10 ,x: 5,y: 10)
//            Swipe Action Delete button
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation(.easeIn){deleteItem()}
                }) {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 60, height: 80)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(8)
                        
                }
            }

            HStack {
                LoadableImage(url: meal.imageUrl)
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text(meal.name)
                         .font(.custom(CustomFont.semiBold, size: 14))
                    
//                    Text("Meal strArea")
//                         .font(.custom(CustomFont.regular, size: 14))
//                         .foregroundColor(.gray)
                                        
                    Text("$\(price.leftPart)")
                        .font(.custom(CustomFont.semiBold,size: 16))
                    +
                    Text(".\(price.rightPart)")
                        .font(.custom(CustomFont.semiBold,size: 12))
                        .foregroundColor(.gray)
                    
                }
                
                CustomStepper(value: $quantity, range: 1...10) { }
                
                
                
            }.background(.white)
            .offset(x: offset)
            .onChange(of: quantity, perform: { _ in
                viewModel.calculateTotalPrice()
            })
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }.padding(.bottom,5)
    }
//    Swipe action funcs
    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if isSwiped {
                offset = value.translation.width - 90
                print(offset, "Meal Swipped")

            } else {
                print(offset, "Meal Offset")
                offset = value.translation.width
                print(value.translation.width, "Value Widht")

            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    offset = -1000
                    deleteItem()
                } else if -offset > 50 {
                    isSwiped = true
                    offset = -110
                } else {
                    isSwiped = false
                    offset = 0
                }
            } else {
                isSwiped = false
                offset = 0
            }
        }
    }
    
    // Removing Item
    func deleteItem() {
        
        viewModel.deleteFromRealm(meal: meal)
        
//        meals.removeAll { (meal) -> Bool in
//            return self.meal.id == meal.id
//        }
    }
}
//
//struct CartCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartCardView(meal: <#T##Binding<CartModel>#>, meals: <#T##Binding<[CartModel]>#>)
//    }
//
//}

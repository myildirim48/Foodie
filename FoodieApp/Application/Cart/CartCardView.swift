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
    @Binding var meal: Meal
    @Binding var meals: [Meal]
    
    var price: (leftPart: Int, rightPart: Int)  {
        get {
            (Double(quantity) * 12.99).splitIntoParts(decimalPlaces: 2, round: true)
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
                LoadableImage(url: meal.strMealThumb)
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text(meal.strMeal)
                         .font(.custom(CustomFont.semiBold, size: 14))
                    
                    Text(meal.strArea + ", \(meal.strCategory)")
                         .font(.custom(CustomFont.regular, size: 14))
                         .foregroundColor(.gray)
                    
                    
                    Text("$\(price.leftPart)")
                        .font(.custom(CustomFont.semiBold,size: 16))
                    +
                    Text(".\(price.rightPart)")
                        .font(.custom(CustomFont.semiBold,size: 12))
                        .foregroundColor(.gray)
                    
                }
                
                CustomStepper(value: $quantity, range: 0...10) { }
            }.background(.white)
            .offset(x: meal.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
//        .frame(width: 350, height: 100)
//            .padding(5)

    }
//    Swipe action funcs
    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if meal.isSwiped {
                meal.offset = value.translation.width - 90
            } else {
                meal.offset = value.translation.width
                print(meal.offset)
                print(value.translation.width)

            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    meal.offset = -1000
                    deleteItem()
                } else if -meal.offset > 50 {
                    meal.isSwiped = true
                    meal.offset = -110
                } else {
                    meal.isSwiped = false
                    meal.offset = 0
                }
            } else {
                meal.isSwiped = false
                meal.offset = 0
            }
        }
    }
    
    // Removing Item
    func deleteItem() {
        meals.removeAll { (meal) -> Bool in
            return self.meal.id == meal.id
        }
    }
}

struct CartCardView_Previews: PreviewProvider {
    static var previews: some View {
        CartCardView(meal: .constant(Meals.mockMeal), meals: .constant(Meals.mockMeals.meals))
    }

}

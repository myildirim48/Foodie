//
//  Double.swift
//  FoodieApp
//
//  Created by YILDIRIM on 28.06.2023.
//

import Foundation

extension Double {
    
    func splitIntoParts(decimalPlaces: Int, round: Bool) -> (leftPart: Int, rightPart: Int) {
        
        var number = self
        if round {
            //round to specified number of decimal places:
            let divisor = pow(10.0, Double(decimalPlaces))
            number = Darwin.round(self * divisor) / divisor
        }
        
        //convert to string and split on decimal point:
        let parts = String(number).components(separatedBy: ".")
        
        //extract left and right parts:
        let leftPart = Int(parts[0]) ?? 0
        let rightPart = Int(parts[1]) ?? 0
        
        return(leftPart, rightPart)
        
    }
}

//
//  Double.swift
//  CMCap
//
//  Created by Naji Achkar on 09/12/21.
//

import Foundation

extension Double {
    
    func computeDecimal()-> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
    
        numberFormatter.maximumFractionDigits = 8
        return numberFormatter.string (from: NSNumber (value: self)) ?? ""
    }
}


extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
}



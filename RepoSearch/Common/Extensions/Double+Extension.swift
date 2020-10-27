//
//  Double+Extension.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import Foundation

extension Double {
    
    func reduceScale(to places: Int) -> Double {
        
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self
        let truncated = Double(Int(newDecimal))
        let originalDecimal = truncated / multiplier
        
        return originalDecimal
    }
}

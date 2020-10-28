//
//  Int+Extension.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import Foundation

extension Int {
    
    var abbreviated: String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)b"

        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)m"

        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)k"

        case 0...:
            return "\(self)"

        default:
            return "\(sign)\(self)"
        }
    }
}

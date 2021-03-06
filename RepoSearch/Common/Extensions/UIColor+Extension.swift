//
//  UIColor+Extension.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

extension UIColor {
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

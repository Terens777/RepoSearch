//
//  UIView+Extension.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {( addSubview($0) )}
    }
}

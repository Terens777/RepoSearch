//
//  LanguageType.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

enum LanguageType: String, Codable, RawRepresentable {
    case JavaScript
    case PHP

    var color: UIColor {
        switch self {
        case .JavaScript:
            return UIColor(red: 207, green: 191, blue: 76)
        case .PHP:
            return UIColor(red: 79, green: 93, blue: 149)
        }
    }
}

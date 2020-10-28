//
//  JSONSerialization+Extension.swift
//  RepoSearch
//
//  Created by Terens on 27.10.2020.
//

import Foundation

extension JSONSerialization {
    
    static func prettyPrinted(data: Data?) -> String {
        guard let data = data else {
            return "Empty data."
        }
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let data = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return "JSONSerialization error: \(error.localizedDescription)\nFallback to string: \(String(data: data, encoding: .utf8) ?? "")"
        }
    }
}

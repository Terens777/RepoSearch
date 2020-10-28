//
//  DataWrapperEntity.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import Foundation

struct DataWrapperEntity<T: Codable>: Codable {
    let items: T
    let totalCount: Int
    
    enum CodingKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
    }
}

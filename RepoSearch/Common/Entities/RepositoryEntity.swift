//
//  RepositoryEntity.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import Foundation

struct RepositoryEntity{
    let id: Int
    let name: String
    let fullName: String
}

extension RepositoryEntity: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
    }
}

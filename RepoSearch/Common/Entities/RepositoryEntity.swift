//
//  RepositoryEntity.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

struct RepositoryEntity {
    let id: Int
    let name: String
    let fullName: String
    let stargazersCount: Int
    let language: String?
    let urlString: String
 
    var stars: String {
        return stargazersCount.abbreviated
    }
}

extension RepositoryEntity: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
        case language = "language"
        case urlString =  "html_url"
    }
}

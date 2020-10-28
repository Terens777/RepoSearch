//
//  RepositoryStorageEntity.swift
//  RepoSearch
//
//  Created by Terens on 28.10.2020.
//

import Foundation
import RealmSwift

class RepositoryStorageEntity: Object {
    @objc dynamic var id: Int = -1
    @objc dynamic var name: String = ""
    @objc dynamic var fullName: String = ""
    @objc dynamic var stargazersCount: Int = 0
    @objc dynamic var language: String? = nil
    @objc dynamic var urlString: String = ""
    
    var entity: RepositoryEntity {
        return .init(
            id: id,
            name: name,
            fullName: fullName,
            stargazersCount: stargazersCount,
            language: language,
            urlString: urlString
        )
    }
}

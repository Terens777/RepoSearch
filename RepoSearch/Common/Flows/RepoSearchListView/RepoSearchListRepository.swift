//
//  RepoSearchListRepository.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import Foundation
import RxSwift

protocol RepoSearchListRepositoryProtocol {
    func search(_ text: String) -> Observable<[RepositoryEntity]>
    
    func getLastSearcedRepositories() -> Observable<[RepositoryEntity]>
}

class RepoSearchListRepository: RepoSearchListRepositoryProtocol {
    private let dataFetch: RepoSearchListDataFetchProtocol
    private let storage = RepositoryStorage()
   
    init(dataFetch: RepoSearchListDataFetchProtocol) {
        self.dataFetch = dataFetch
    }
    
    func search(_ text: String) -> Observable<[RepositoryEntity]> {
        let repo = storage
        return dataFetch
            .search(fromText: text)
            .catchErrorJustReturn([])
            .filter({ !$0.isEmpty })
            .flatMapLatest({ repo.save(objects: $0) })
            .flatMapLatest({ _ in repo.repositories })
    }
    
    func getLastSearcedRepositories() -> Observable<[RepositoryEntity]> {
        return storage.repositories
    }
}

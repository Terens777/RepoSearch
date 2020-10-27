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
}

class RepoSearchListRepository: RepoSearchListRepositoryProtocol {
    
    private let dataFetch: RepoSearchListDataFetchProtocol
    
    init(dataFetch: RepoSearchListDataFetchProtocol) {
        self.dataFetch = dataFetch
    }
    
    func search(_ text: String) -> Observable<[RepositoryEntity]> {
        return dataFetch
            .search(fromText: text)
            .catchErrorJustReturn([])
    }
}

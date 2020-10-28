//
//  RepoSearchListDataFetch.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import Foundation
import RxCocoa
import RxSwift

protocol RepoSearchListDataFetchProtocol {
    func search(fromText text: String) -> Observable<[RepositoryEntity]>
}

class RepoSearchListDataFetch: RepoSearchListDataFetchProtocol {
    private let network: NetworkCore
    private let requestSerialScheduler = SerialDispatchQueueScheduler(qos: .userInitiated)
    
    init(network: NetworkCore) {
        self.network = network
    }
    
    func search(fromText text: String) -> Observable<[RepositoryEntity]> {
        let query: [URLQueryItem] = [.init(name: "q", value: text)]
        let requestSerialScheduler = self.requestSerialScheduler
        return network.fetch(
            with: NetworkRequestBuilder(endpoint: .getGitHubRepo, queryItems: query),
            parser: NetworkParser<DataWrapperEntity<[RepositoryEntity]>>()
        )
        .subscribeOn(requestSerialScheduler)
        .observeOn(MainScheduler.asyncInstance)
        .map({ $0.items })
    }
}


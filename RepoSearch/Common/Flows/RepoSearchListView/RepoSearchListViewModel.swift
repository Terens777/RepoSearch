//
//  RepoSearchListViewModel.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftExt

protocol RepoSearchListViewModelProtocol {
    
    var tableData: BehaviorRelay<[TableCellDataProtocol]> { get }
    
    func onSearch(fromText text: String)
}

class RepoSearchListViewModel: RepoSearchListViewModelProtocol {
    let tableData: BehaviorRelay<[TableCellDataProtocol]> = BehaviorRelay(value: [])
    private let dataFetch: RepoSearchListDataFetchProtocol
    private let searchText: PublishRelay<String> = PublishRelay()
    private unowned let coordinator: AppCoordinatorProtocol & Coordinator
    private let bag: DisposeBag = DisposeBag()
    
    init(dataFetch: RepoSearchListDataFetchProtocol, coordinator: AppCoordinatorProtocol & Coordinator) {
        self.dataFetch = dataFetch
        self.coordinator = coordinator
        bind()
    }
    
    private func bind() {
        searchText
            .throttle(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .flatMapLatest(dataFetch.search)
            .subscribe(onNext: { [weak self] data in
                self?.tableData.accept(data.map(RepoTableCellObject.init))
            }, onError: { error in
                debugPrint("[ERROR]: \(error.localizedDescription)", #file)
            })
            .disposed(by: bag)
    }
    
    func onSearch(fromText text: String) {
        searchText.accept(text)
    }
    
    deinit {
        debugPrint("[DEINIT]: \(self)")
    }
}

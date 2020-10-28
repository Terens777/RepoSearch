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
    func onSelect(object: RepositoryEntity)
}

class RepoSearchListViewModel: RepoSearchListViewModelProtocol {
    let tableData: BehaviorRelay<[TableCellDataProtocol]> = BehaviorRelay(value: [])
    private let repository: RepoSearchListRepositoryProtocol
    private let searchText: PublishRelay<String> = PublishRelay()
    private let coordinator: AppCoordinatorProtocol & Coordinator
    private let bag: DisposeBag = DisposeBag()
    
    init(repository: RepoSearchListRepositoryProtocol, coordinator: AppCoordinatorProtocol & Coordinator) {
        self.repository = repository
        self.coordinator = coordinator
        loadData()
        bind()
    }
    
    private func loadData() {
        repository.getLastSearcedRepositories()
            .map({ $0.map(RepoTableCellObject.init) })
            .bind(to: tableData)
            .disposed(by: bag)
    }
    
    private func bind() {
        let search = repository.search
        searchText
            .throttle(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
            .flatMapLatest(search)
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
    
    func onSelect(object: RepositoryEntity) {
        coordinator.onOpenDetails(data: object)
    }
    
    deinit {
        debugPrint("[DEINIT]: \(self)")
    }
}

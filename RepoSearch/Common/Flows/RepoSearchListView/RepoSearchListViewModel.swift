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
    private let repository: RepoSearchListRepositoryProtocol
    private let searchText: PublishRelay<String> = PublishRelay()
    private unowned let coordinator: AppCoordinatorProtocol & Coordinator
    private let bag: DisposeBag = DisposeBag()
    
    init(repository: RepoSearchListRepositoryProtocol, coordinator: AppCoordinatorProtocol & Coordinator) {
        self.repository = repository
        self.coordinator = coordinator
        initMock()
        //bind()
    }
    
    private func initMock() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            let data = Mock().data.map(RepoTableCellObject.init)
            self?.tableData.accept(data)
        }
    }
    
    private func bind() {
        let search = repository.search
        searchText
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
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
    
    deinit {
        debugPrint("[DEINIT]: \(self)")
    }
}

//MARK: -Mock data
struct Mock {
    var data: [RepositoryEntity] {
        return [
            .init(id: 1, name: "JQuery", fullName: "JQuery repo", stargazersCount: 222, language: "JavaScript"),
            .init(id: 2, name: "RxSwift", fullName: "RxSwift/RxCocoa", stargazersCount: 32434, language: "JavaScript"),
            .init(id: 3, name: "ObjectMapper", fullName: "ObjectMapper/Decoding", stargazersCount: 23434, language: "JavaScript"),
            .init(id: 4, name: "Alamofire", fullName: "Alamofire networking", stargazersCount: 342344, language: "JavaScript"),
        ]
    }
}

//
//  RepoSearchListViewController.swift
//  RepoSearch
//
//  Created by Terens on 24.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

class RepoSearchListViewController: UIViewController {
    let contentView: RepoSearchListViewProtocol & UIView
    let viewModel: RepoSearchListViewModelProtocol
    private let bag: DisposeBag = DisposeBag()
    
    init(contentView: RepoSearchListViewProtocol & UIView, viewModel: RepoSearchListViewModelProtocol) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func bind() {
        viewModel.tableData
            .asDriver()
            .drive(contentView.tableView.rx.items)(TableCellFactory.getCellRx)
            .disposed(by: bag)
        contentView.searchedText
            .filter({ !($0.isEmpty) })
            .subscribeNext(weak: self, { $0.viewModel.onSearch })
            .disposed(by: bag)
    }
    
    private func configure() {
        title = "github.com"
    }
}

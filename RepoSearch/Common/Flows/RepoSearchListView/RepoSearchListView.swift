//
//  RepoSearchListView.swift
//  RepoSearch
//
//  Created by Terens on 25.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

protocol RepoSearchListViewProtocol {
    var tableView: UITableView { get }
    
    var searchedText: PublishRelay<String> { get }
}

class RepoSearchListView: UIView, RepoSearchListViewProtocol {
    
    private let contentView = UIView()
    private let bag = DisposeBag()
    let searchBar: UISearchBar = UISearchBar().then {
        $0.autocorrectionType = .no
        $0.autocapitalizationType = .none
    }
    let tableView: UITableView = UITableView().then {
        $0.separatorStyle = .none
        $0.keyboardDismissMode = .onDrag
    }
    let searchedText: PublishRelay<String> = PublishRelay()
   
    init() {
        super.init(frame: .zero)
        addViews()
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(contentView)
        contentView.addSubviews(searchBar, tableView)
        contentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            if #available(iOS 11.0, *) {
                $0.top.equalTo(safeAreaLayoutGuide.snp.top)
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            } else {
                $0.top.bottom.equalToSuperview()
            }
        }
        searchBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configure() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        searchBar.tintColor = .black
        searchBar.backgroundColor = .white
    }
    
    private func bind() {
        searchBar.rx.text
            .compactMap({ $0 })
            .subscribeNext(weak: self, { $0.searchedText.accept })
            .disposed(by: bag)
        searchBar.rx.searchButtonClicked
            .subscribeNext(weak: self, { v in
                { _ in
                    v.searchBar.resignFirstResponder()
                }
            })
            .disposed(by: bag)
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {( addSubview($0) )}
    }
}


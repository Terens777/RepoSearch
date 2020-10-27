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
}

class RepoSearchListView: UIView, RepoSearchListViewProtocol {
    
    private let contentView = UIView()
    private let bag = DisposeBag()
    let searchBar: UISearchBar = UISearchBar()
    let tableView: UITableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        addViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(contentView)
        contentView.addSubviews(searchBar, tableView)
        contentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
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
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {( addSubview($0) )}
    }
}


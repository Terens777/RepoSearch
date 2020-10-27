//
//  RepoSearchListConfigurator.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

struct RepoSearchListConfigurator {
    let controller: UIViewController
    
    init(network: NetworkCore, coordinator: AppCoordinatorProtocol & Coordinator) {
        let view = RepoSearchListView()
        let dataFetch = RepoSearchListDataFetch(network: network)
        let viewModel = RepoSearchListViewModel(dataFetch: dataFetch, coordinator: coordinator)
        controller = RepoSearchListViewController(contentView: view, viewModel: viewModel)
    }
}

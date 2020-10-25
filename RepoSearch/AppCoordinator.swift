//
//  AppCoordinator.swift
//  RepoSearch
//
//  Created by Terens on 24.10.2020.
//

import UIKit

class AppCoordinator: BaseCoordinator {
   
    init(in window: inout UIWindow?) {
        super.init(in: &window, presentationController: UINavigationController())
    }
    
    override func onStart(animated: Bool = true) {
        let view = RepoSearchListView()
        let controller = RepoSearchListViewController(contentView: view)
        presentationController.setViewControllers([controller], animated: animated)
    }
}


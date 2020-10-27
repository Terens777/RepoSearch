//
//  AppCoordinator.swift
//  RepoSearch
//
//  Created by Terens on 24.10.2020.
//

import UIKit

protocol AppCoordinatorProtocol: class {
    
    func onOpenDetails()
}

class AppCoordinator: BaseCoordinator, AppCoordinatorProtocol {
   
    init(in window: inout UIWindow?, network: NetworkCore) {
        super.init(in: &window, network: network, presentationController: UINavigationController())
    }
    
    override func onStart(animated: Bool = true) {
        let controller = RepoSearchListConfigurator(network: network, coordinator: self).controller
        presentationController.setViewControllers([controller], animated: animated)
    }
    
    func onOpenDetails() {
        
    }
}


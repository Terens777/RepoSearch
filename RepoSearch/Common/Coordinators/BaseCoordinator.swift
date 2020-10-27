//
//  BaseCoordinator.swift
//  RepoSearch
//
//  Created by Terens on 24.10.2020.
//

import UIKit

class BaseCoordinator: Coordinator {
    var presentationController: UINavigationController
    weak var window: UIWindow?
    
    init(in window: inout UIWindow?, presentationController: UINavigationController = UINavigationController()) {
        self.presentationController = presentationController
        checkWindow(&window)
        window?.rootViewController = presentationController
        self.window = window
    }
    
    func checkWindow(_ window: inout UIWindow?) {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
        }
    }
    
    func onStart(animated: Bool = true) {
       fatalError("Implement: \(self) ...")
    }
    
    func onBack(animated: Bool = true) {
        presentationController.popViewController(animated: animated)
    }
    
    func onError(_ error: Error) {
        
    }
}

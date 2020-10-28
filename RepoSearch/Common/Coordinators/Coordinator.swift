//
//  Coordinator.swift
//  RepoSearch
//
//  Created by Terens on 24.10.2020.
//

import UIKit

protocol Coordinator {
    var presentationController: UINavigationController { get }
    
    func onStart(animated: Bool)
    func onBack(animated: Bool)
    func onError(_ error: Error)
}

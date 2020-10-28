//
//  AppDelegate.swift
//  RepoSearch
//
//  Created by Terens on 24.10.2020.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var network: NetworkCore!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        network = NetworkCore()
        AppCoordinator(in: &window, network: network).onStart()
        return true
    }
}


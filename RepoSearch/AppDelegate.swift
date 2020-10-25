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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppCoordinator(in: &window).onStart()
        return true
    }
}


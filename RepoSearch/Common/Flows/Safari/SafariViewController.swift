//
//  SafariViewController.swift
//  RepoSearch
//
//  Created by Danil on 10/28/20.
//

import Foundation
import SafariServices

class SafariViewController: SFSafariViewController {
    
    init(urlPath url: URL) {
        super.init(url: url, configuration: .init())
        configure()
    }
    
    private func configure() {
        preferredControlTintColor = .black
        if #available(iOS 13.0, *) {
            modalPresentationStyle = .automatic
        } else {
            modalPresentationStyle = .overFullScreen
        }
    }
}

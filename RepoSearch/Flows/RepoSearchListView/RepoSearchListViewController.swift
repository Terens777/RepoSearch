//
//  RepoSearchListViewController.swift
//  RepoSearch
//
//  Created by Terens on 24.10.2020.
//

import UIKit

class RepoSearchListViewController: UIViewController {
    
    let contentView: RepoSearchListViewProtocol & UIView
    
    override func loadView() {
        view = contentView
    }
    
    init(contentView: RepoSearchListViewProtocol & UIView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        title = "Search repo in github.com"
    }
}

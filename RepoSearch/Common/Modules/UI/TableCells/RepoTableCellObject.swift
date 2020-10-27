//
//  RepoTableCellObject.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

struct RepoTableCellObject {
    let data: RepositoryEntity
}

extension RepoTableCellObject: TableCellDataProtocol {
    static var tableCellClass: (UITableViewCell & Identifiable & ConfigurableCellProtocol).Type {
        return RepoTableCell.self
    }
}

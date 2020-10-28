//
//  SMBaseTableCellFactory.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

enum TableCellFactory {
    
    static func getCellRx(from tableView: UITableView, index: Int, for object: TableCellDataProtocol) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: object.tableCellIdentifier) as? (ConfigurableCellProtocol & UITableViewCell) {
            cell.configure(data: object)
            return cell
        } else {
            tableView.register(object.tableCellClass, forCellReuseIdentifier: object.tableCellIdentifier)
            return getCellRx(from: tableView, index: index, for: object)
        }
    }
}

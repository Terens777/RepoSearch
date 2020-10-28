//
//  File.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//


import UIKit

//MARK: TableCellDataProtocol
protocol TableCellDataProtocol {
    static var tableCellClass: (UITableViewCell & Identifiable & ConfigurableCellProtocol).Type { get }
}

extension TableCellDataProtocol {
    var tableCellClass: (UITableViewCell & Identifiable & ConfigurableCellProtocol).Type {
        return Self.tableCellClass
    }
    static var tableCellIndentifier: String {
        return tableCellClass.identifier
    }
    var tableCellIdentifier: String {
        return Self.tableCellIndentifier
    }
}

//MARK: -ConfigurableCellProtocol
protocol ConfigurableCellProtocol {
    func configure(data: TableCellDataProtocol)
}

extension ConfigurableCellProtocol {
    func configure(data: TableCellDataProtocol) {}
}

//MARK: -Identifiable
protocol Identifiable {
    static var identifier: String { get }
    var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
    var identifier: String {
        return Self.identifier
    }
}

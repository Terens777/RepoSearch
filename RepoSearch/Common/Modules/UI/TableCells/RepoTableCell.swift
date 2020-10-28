//
//  RepoTableCell.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit
import RxSwift

class RepoTableCell: UITableViewCell, Identifiable {
    private let dataView: RepoCardViewProtocol & UIView = RepoCardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func addElements() {
        contentView.addSubview(dataView)
        dataView.snp.makeConstraints {
            $0.top.equalTo(8)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview()
        }
    }
}

extension RepoTableCell: ConfigurableCellProtocol {
    
    func configure(data: TableCellDataProtocol) {
        let object = data as! RepoTableCellObject
        dataView.configure(data: object.data)
    }
}

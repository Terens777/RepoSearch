//
//  RepoTableCell.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit
import RxSwift

class RepoTableCell: UITableViewCell, Identifiable {

    private var bag: DisposeBag!
    private let label: UILabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
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
        backgroundColor = .white
    }
    
    private func addElements() {
        addSubviews(label)
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-14)
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func configure(data: RepositoryEntity) {
        label.text = data.fullName
    }
}

extension RepoTableCell: ConfigurableCellProtocol {
    
    func configure(data: TableCellDataProtocol) {
        bag = DisposeBag()
        let object = data as! RepoTableCellObject
        configure(data: object.data)
    }
}

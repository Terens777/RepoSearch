//
//  RepoCardView.swift
//  RepoSearch
//
//  Created by Danil on 10/27/20.
//

import UIKit

protocol RepoCardViewProtocol {
    func configure(data: RepositoryEntity)
}

class RepoCardView: UIView, RepoCardViewProtocol {
    private let titleLabel: UILabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    private let descriptionLabel: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .gray
    }
    private let starLabel: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .lightGray
    }
    private let languageLabel: UILabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 12)
        $0.textColor = .lightGray
    }
    private let circleView: UIView = UIView().then {
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
    }
    private let starIcomImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "star")
        $0.contentMode = .scaleAspectFit
    }
    
    init() {
        super.init(frame: .zero)
        addElements()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: RepositoryEntity) {
        titleLabel.text = data.name
        descriptionLabel.text = data.fullName
        starLabel.text = data.stars
        languageLabel.text = data.language ?? ""
        circleView.backgroundColor = LanguageType(rawValue: data.language ?? "")?.color ?? .brown
        layer.cornerRadius = 8
    }
    
    private func configure() {
        backgroundColor = .white
    }
    
    private func addElements() {
        addSubviews(titleLabel, starLabel, starIcomImageView, descriptionLabel, languageLabel, circleView)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        starIcomImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.centerY.equalTo(starLabel.snp.centerY)
            $0.height.equalTo(15)
            $0.width.equalTo(18)
            $0.bottom.equalToSuperview().offset(-12)
        }
        starLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.leading.equalTo(starIcomImageView.snp.trailing).offset(4)
            $0.trailing.equalTo(titleLabel.snp.trailing)
        }
        languageLabel.snp.makeConstraints {
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.bottom.equalTo(starLabel.snp.bottom)
        }
        circleView.snp.makeConstraints {
            $0.trailing.equalTo(languageLabel.snp.leading).offset(-4)
            $0.centerY.equalTo(languageLabel.snp.centerY)
            $0.size.equalTo(10)
        }
    }
}



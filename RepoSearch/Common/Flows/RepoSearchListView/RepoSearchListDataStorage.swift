//
//  RepoSearchListDataStorage.swift
//  RepoSearch
//
//  Created by Terens on 28.10.2020.
//

import Foundation
import RealmSwift
import RxSwift

class RepositoryStorage {
    private let serialDispatch = DispatchQueue(label: "com.com.serachrepo.realm")
    
    func save(objects: [RepositoryEntity]) -> Observable<Void> {
        return Observable.create({ [weak self] observable in
            self?.serialDispatch.async {
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.deleteAll()
                    }
                    for object in objects {
                        let realmObject = RepositoryStorageEntity()
                        realmObject.id = object.id
                        realmObject.name = object.name
                        realmObject.fullName = object.fullName
                        realmObject.stargazersCount = object.stargazersCount
                        realmObject.language = object.language
                        try realm.write {
                            realm.add(realmObject)
                        }
                    }
                    observable.onNext(())
                    observable.onCompleted()
                } catch {
                    debugPrint("[ERROR]: \(error.localizedDescription)", #function)
                    observable.onError(error)
                }
            }
            return Disposables.create()
        })
        .observeOn(MainScheduler.asyncInstance)
    }
    
    func getObjects() -> Observable<[RepositoryEntity]> {
        return Observable.create({ [weak self] observable in
            self?.serialDispatch.async {
                do {
                    let realm = try Realm()
                    var repositories: [RepositoryEntity] = []
                    for repository in realm.objects(RepositoryStorageEntity.self) {
                        repositories.append(repository.entity)
                    }
                    observable.onNext(repositories)
                    observable.onCompleted()
                } catch {
                    debugPrint("[ERROR]: \(error.localizedDescription)", #function)
                    observable.onError(error)
                }
            }
            return Disposables.create()
        })
        .observeOn(MainScheduler.asyncInstance)
    }
}

struct Mock {
    var data: [RepositoryEntity] {
        return [
            .init(id: 1, name: "JQuery", fullName: "JQuery repo", stargazersCount: 222, language: "JavaScript"),
            .init(id: 2, name: "RxSwift", fullName: "RxSwift/RxCocoa", stargazersCount: 32434, language: "JavaScript"),
            .init(id: 3, name: "ObjectMapper", fullName: "ObjectMapper/Decoding", stargazersCount: 23434, language: "JavaScript"),
            .init(id: 4, name: "Alamofire", fullName: "Alamofire networking", stargazersCount: 342344, language: "JavaScript"),
            .init(id: 1, name: "React", fullName: "React ls", stargazersCount: 3243, language: "JavaScript"),
            .init(id: 2, name: "Objective C", fullName: "<<***!!??**&&&", stargazersCount: 123, language: "Objective C"),
            .init(id: 3, name: "GO", fullName: "Google / go", stargazersCount: 6565, language: "Golang"),
            .init(id: 4, name: "C++", fullName: "x_x", stargazersCount: 42343, language: "C++"),
        ]
    }
}

//
//  Observable+Extension.swift
//  RepoSearch
//
//  Created by Terens on 27.10.2020.
//

import Foundation
import RxSwift

extension ObservableType where Element == (response: HTTPURLResponse, data: Data) {
    
    func debugLogResponse(request: URLRequest, entityType: String?) -> RxSwift.Observable<Self.Element> {
        #if DEBUG
        return self.do(onNext: { (response, data) in
            NetworkingLogger.log(
                request: request,
                data: data,
                response: response,
                error: nil,
                entityType: entityType
            )
        }, onError: { error in
            NetworkingLogger.log(
                request: request,
                data: nil,
                response: nil,
                error: error
            )
        })
        #else
        return self.do()
        #endif
    }
}

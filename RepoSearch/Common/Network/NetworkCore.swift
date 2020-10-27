//
//  NetworkCore.swift
//  RepoSearch
//
//  Created by Terens on 26.10.2020.
//

import Foundation
import RxSwift

class SMNetworkingCore {

    func fetch<T: Codable>(with requestBuilder: NetworkRequestBuilder, parser: NetworkParser<T>) -> Observable<T> {
        return fetchData(requestBuilder: requestBuilder, parser: parser)
    }
    
    private func fetchData<T: Codable>(requestBuilder: NetworkRequestBuilder, parser: NetworkParser<T>) -> Observable<T> {
        let request = requestBuilder.request
        let validateResponse = self.validateResponse
        return coreRequest(request: request)
            .debugLogResponse(request: request, entityType: String(describing: T.Type.self))
            .map({ (response, data) -> Data in
                if validateResponse(response) {
                    return data
                } else {
                    throw NetworkParserError.emptyData
                }
            })
            .map { try parser.parse(data: $0) }
            .do(onError: { error in
                #if DEBUG
                NetworkingLogger.log(request: request, data: nil, response: nil, error: error)
                #endif
            })
    }

    private func coreRequest(request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)> {
        return URLSession.shared.rx.response(request: request)
    }
   
    private func validateResponse(_ response: URLResponse) -> Bool {
        if let response = response as? HTTPURLResponse {
            return (200...299) ~= response.statusCode
        } else {
            return false
        }
    }
}

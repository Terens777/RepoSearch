//
//  NetworkRequestBuilder.swift
//  RepoSearch
//
//  Created by Terens on 26.10.2020.
//

import Foundation

struct NetworkRequestBuilder {
    let endpoint: NetworkEndpoint
    let queryItems: [URLQueryItem]?
    
    private var composedUrl: URL {
        let url = endpoint.url
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        return urlComponents?.url ?? url
    }
    
    var request: URLRequest {
        var request = URLRequest(
            url: composedUrl,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 30
        )
        request.httpMethod = endpoint.method.rawValue
        return request
    }
}

extension NetworkRequestBuilder {
    
    init(endpoint: NetworkEndpoint) {
        self.endpoint = endpoint
        self.queryItems = nil
    }
}

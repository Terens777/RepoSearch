//
//  NetworkRequestBuilder.swift
//  RepoSearch
//
//  Created by Terens on 26.10.2020.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
    case PATCH
    case DELETE
}

struct NetworkRequestBuilder {
    let endpoint: NetworkEndpoint
    
    var request: URLRequest {
        var request = URLRequest(
            url: endpoint.url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 30
        )
        request.httpMethod = endpoint.method.rawValue
        return request
    }
  
    init(endpoint: NetworkEndpoint) {
        self.endpoint = endpoint
    }
}

//
//  NetworkEndpoint.swift
//  RepoSearch
//
//  Created by Terens on 26.10.2020.
//

import Foundation

enum NetworkEndpoint {
    
    case getGitHubRepo

    var url: URL {
        return URL(string: "http://")!
    }
    
    var method: HttpMethod {
        switch self {
        case .getGitHubRepo:
            return .GET
        }
    }
}



//
//  NetworkParserError.swift
//  RepoSearch
//
//  Created by Terens on 27.10.2020.
//

import Foundation

enum NetworkParserError: Error {
    case emptyData
    case message(_ string: String)
}

extension NetworkParserError: LocalizedError {
    
    var localizedDescription: String {
        switch self {
        case .emptyData:
            return "Empty response data"
        case let .message(message):
            return message
        }
    }
    
    var errorDescription: String? {
        return localizedDescription
    }
}

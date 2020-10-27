//
//  NetworkParser.swift
//  RepoSearch
//
//  Created by Terens on 27.10.2020.
//

import Foundation

class NetworkParser<T: Codable> {
    let dateDecodingStrategy: JSONDecoder.DateDecodingStrategy
    let keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy
    
    init() {
        self.dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.secondsSince1970
        self.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.useDefaultKeys
    }
    
    init(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) {
        self.dateDecodingStrategy = dateDecodingStrategy
        self.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.useDefaultKeys
    }
    
    init(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) {
        self.dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.secondsSince1970
        self.keyDecodingStrategy = keyDecodingStrategy
    }
    
    init(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) {
        self.dateDecodingStrategy = dateDecodingStrategy
        self.keyDecodingStrategy = keyDecodingStrategy
    }
    
    func parse(data: Data?) throws -> T {
        guard let data = data else {
            throw NetworkParserError.emptyData
        }
        return try JSONDecoder()
            .then({
                $0.dateDecodingStrategy = dateDecodingStrategy
                $0.keyDecodingStrategy = keyDecodingStrategy
            })
            .decode(T.self, from: data)
    }
}


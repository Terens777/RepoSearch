//
//  Configurable.swift
//  RepoSearch
//
//  Created by Terens on 27.10.2020.
//

import Foundation

extension NSObject: Configurable {}

public protocol Configurable: AnyObject {}

public extension Configurable {
    
    func then(_ configure: (Self) throws -> Void) rethrows -> Self {
        try configure(self)
        return self
    }
}

//
//  NetworkingLogger.swift
//  RepoSearch
//
//  Created by Terens on 27.10.2020.
//

import Foundation

enum NetworkingLogger {
    static var maxBodyLength: Int = 50000
    
    static func log(request: URLRequest?, data: Data?, response: URLResponse?, error: Error?, entityType: String? = nil) {
        if let request = request {
            print("\n------ Request begin")
            print("URL:")
            print(request.url?.absoluteString ?? "")
            print("Headers:")
            request.allHTTPHeaderFields?.forEach({ print("\($0.key): \($0.value)") })
            print("Method: \(request.httpMethod ?? "")")
            print("Body:")
            print(JSONSerialization.prettyPrinted(data: request.httpBody).prefix(maxBodyLength))
            print("--- Request end")
        }
        if let response = response {
            print("------ Response begin")
            print("Status code: \(String(describing: (response as? HTTPURLResponse)?.statusCode ?? -1))")
            print("Body")
            if let entityType = entityType {
                print(entityType)
            }
            print(JSONSerialization.prettyPrinted(data: data).prefix(maxBodyLength))
            print("--- Response end")
        }
        if let error = error {
            print("------ Response begin error")
            print("error: \(error)")
            print("localized error: \(error.localizedDescription)")
            print("--- Response end")
        }
    }
}

//
//  NetworkLogger.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

enum NetworkLogger {
    static func log(request: URLRequest) {
        print("➡️ Request: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
        if let headers = request.allHTTPHeaderFields {
            print("Headers: \(headers)")
        }
        if let body = request.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            print("Body: \(bodyString)")
        }
    }

    static func log(response: URLResponse?, data: Data?, error: Error?) {
        if let httpResponse = response as? HTTPURLResponse {
            print("⬅️ Response: \(httpResponse.statusCode) \(httpResponse.url?.absoluteString ?? "")")
        }

        if let data, let bodyString = String(data: data, encoding: .utf8) {
            print("Response Body: \(bodyString)")
        }

        if let error {
            print("❌ Error: \(error.localizedDescription)")
        }
    }
}

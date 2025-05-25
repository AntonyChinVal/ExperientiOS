//
//  APIConfig.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

enum APIConfig {
    static let baseURL = "https://68302087f504aa3c70f66864.mockapi.io/experient/api/v1"

    enum Auth {
        static var login: URL { URL(string: "\(APIConfig.baseURL)/auth")! }
        static var refreshSuccess: URL { URL(string: "\(APIConfig.baseURL)/refreshSuccess")! }
        static var refreshError: URL { URL(string: "\(APIConfig.baseURL)/refreshError")! }
    }

    enum User {
        static var getUser: URL { URL(string: "\(APIConfig.baseURL)/user/1")! }
    }
}

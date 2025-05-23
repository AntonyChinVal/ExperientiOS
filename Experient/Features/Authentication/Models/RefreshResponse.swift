//
//  RefreshResponse.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

struct RefreshResponse: Codable {
    let authorized: Bool
    let accessToken: String
    let refreshToken: String
}

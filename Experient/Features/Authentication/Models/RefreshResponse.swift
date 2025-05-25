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

enum RefreshResponseMock {
    static let sample = RefreshResponse(
        authorized: true,
        accessToken: "mock_access_token",
        refreshToken: "mock_refresh_token"
    )
}

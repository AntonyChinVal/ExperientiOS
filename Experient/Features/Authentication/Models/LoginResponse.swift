//
//  LoginResponse.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

struct AuthResponse: Codable {
    let user: User
    let accessToken: String
    let refreshToken: String
}

enum AuthResponseMock {
    static let sample = AuthResponse(
        user: UserMock.sample,
        accessToken: "mock_access_token",
        refreshToken: "mock_refresh_token"
    )
}

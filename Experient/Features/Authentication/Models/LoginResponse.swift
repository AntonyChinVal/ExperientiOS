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

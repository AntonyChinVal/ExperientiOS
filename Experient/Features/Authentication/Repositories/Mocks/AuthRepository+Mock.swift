//
//  AuthRepository+Mock.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

class AuthRepositoryMock: AuthRepository {
    var loginResult: Result<AuthResponse, Error> = .success(AuthResponseMock.sample)
    var refreshTokenResult: Result<RefreshResponse, Error> = .success(RefreshResponseMock.sample)
    var logoutCalled = false
    var token: String? = nil

    func login(username: String, password: String) async throws -> AuthResponse {
        switch loginResult {
        case .success(let response): return response
        case .failure(let error): throw error
        }
    }

    func refreshToken(isSuccess: Bool) async throws -> RefreshResponse {
        switch refreshTokenResult {
        case .success(let response): return response
        case .failure(let error): throw error
        }
    }

    func logout() async throws {
        logoutCalled = true
    }

    func readToken() -> String? {
        return token
    }
}

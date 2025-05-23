//
//  AuthRepositoryImpl.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

class AuthRepositoryImpl: AuthRepository {
    private let keychain: KeychainService
    private let network: NetworkService
    private let loginEndpoint = URL(string: "https://68302087f504aa3c70f66864.mockapi.io/experient/api/v1/auth")!
    private let refreshSuccessEndpoint =
        URL(string: "https://68302087f504aa3c70f66864.mockapi.io/experient/api/v1/refreshSuccess")!
    private let refreshErrorEndpoint =
        URL(string: "https://68302087f504aa3c70f66864.mockapi.io/experient/api/v1/refreshError")!
    private let getUserEndpoint = URL(string: "https://68302087f504aa3c70f66864.mockapi.io/experient/api/v1/user")!
    private let accessTokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"

    init(keychain: KeychainService, network: NetworkService) {
        self.keychain = keychain
        self.network = network
    }

    func login(username: String, password: String) async throws -> AuthResponse {
        let request = LoginRequest(username: username, password: password)
        let response = try await network.post(url: loginEndpoint, body: request, responseType: AuthResponse.self)
        keychain.save(response.accessToken, key: accessTokenKey)
        keychain.save(response.refreshToken, key: refreshTokenKey)
        return response
    }

    func refreshToken(isSuccess: Bool) async throws -> RefreshResponse {
        let refreshToken = keychain.read(key: refreshTokenKey) ?? ""
        let request = RefreshRequest(refreshToken: refreshToken)
        let url = isSuccess ? refreshSuccessEndpoint : refreshErrorEndpoint
        let response = try await network.post(url: url, body: request, responseType: RefreshResponse.self)
        if response.authorized {
            keychain.save(response.accessToken, key: accessTokenKey)
            keychain.save(response.refreshToken, key: refreshTokenKey)
            return response
        } else {
            keychain.delete(key: accessTokenKey)
            keychain.delete(key: refreshTokenKey)
            throw NetworkError.unauthorized
        }
    }

    func logout() async throws {
        keychain.delete(key: accessTokenKey)
        keychain.delete(key: refreshTokenKey)
    }

    func readToken() -> String? {
        return keychain.read(key: accessTokenKey)
    }
}

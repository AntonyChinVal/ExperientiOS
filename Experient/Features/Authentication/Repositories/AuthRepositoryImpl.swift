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
    private let accessTokenKey = StorageConfig.accessTokenKey
    private let refreshTokenKey = StorageConfig.refreshTokenKey

    init(keychain: KeychainService, network: NetworkService) {
        self.keychain = keychain
        self.network = network
    }

    func login(username: String, password: String) async throws -> AuthResponse {
        let request = LoginRequest(username: username, password: password)
        let response = try await network.post(url: APIConfig.Auth.login, body: request, responseType: AuthResponse.self)
        keychain.save(response.accessToken, key: accessTokenKey)
        keychain.save(response.refreshToken, key: refreshTokenKey)
        return response
    }

    func refreshToken(isSuccess: Bool) async throws -> RefreshResponse {
        let refreshToken = keychain.read(key: refreshTokenKey) ?? ""
        let request = RefreshRequest(refreshToken: refreshToken)
        let url = isSuccess ? APIConfig.Auth.refreshSuccess : APIConfig.Auth.refreshError
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

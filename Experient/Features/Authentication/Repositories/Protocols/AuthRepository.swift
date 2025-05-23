//
//  AuthRepository.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

protocol AuthRepository {
    func login(username: String, password: String) async throws -> AuthResponse
    func refreshToken(isSuccess: Bool) async throws -> RefreshResponse
    func logout() async throws
    func readToken() -> String?
}

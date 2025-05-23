//
//  AuthRepository.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

protocol AuthRepository {
    func login(username: String, password: String) async -> AuthResponse?
    func readToken(key: String) -> String?
    func saveToken(_ token: String, key: String)
    func deleteToken(key: String)
}

//
//  AuthViewModel.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var user: User?
    @Published var isLoading = false

    private let repository: AuthRepository
    private let accessTokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"

    init(repository: AuthRepository) {
        self.repository = repository
        checkAuthentication()
    }

    @MainActor
    func login(username: String, password: String) {
        Task {
            self.isLoading = true
            defer { self.isLoading = false }

            if let response = await repository.login(username: username, password: password) {
                self.user = response.user
                repository.saveToken(response.accessToken, key: accessTokenKey)
                repository.saveToken(response.refreshToken, key: refreshTokenKey)
                self.isAuthenticated = true
            }
        }
    }
    
    func logout() {
        repository.deleteToken(key: accessTokenKey)
        repository.deleteToken(key: refreshTokenKey)
        self.isAuthenticated = false
        self.user = nil
    }

    private func checkAuthentication() {
        if repository.readToken(key: accessTokenKey) != nil {
            self.isAuthenticated = true
        }
    }
}

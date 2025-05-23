//
//  AuthViewModel.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//
import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var user: User?
    @Published var isLoading = false

    private let authRepository: AuthRepository
    private let userRepository: UserRepository
    private let accessTokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"

    init(authRepository: AuthRepository, userRepository: UserRepository) {
        self.authRepository = authRepository
        self.userRepository = userRepository
        self.checkAuthentication()
    }

    func login(username: String, password: String) {
        Task {
            self.isLoading = true
            defer { self.isLoading = false }

            do {
                let response = try await authRepository.login(username: username, password: password)
                self.user = response.user
                self.isAuthenticated = true
            } catch {
                print("Login failed with error: \(error)")
                self.isAuthenticated = false
            }
        }
    }

    func refreshToken(isSuccess: Bool) {
        Task {
            self.isLoading = true
            defer { self.isLoading = false }

            do {
                _ = try await authRepository.refreshToken(isSuccess: isSuccess)
                self.isAuthenticated = true
            } catch {
                print("Refresh token failed with error: \(error)")
                self.isAuthenticated = false
            }
        }
    }

    func logout() {
        Task {
            self.isLoading = true
            defer { self.isLoading = false }

            do {
                try await authRepository.logout()
                isAuthenticated = false
                user = nil
            } catch {
                print("Logout failed with error: \(error)")
            }
        }
    }

    private func checkAuthentication() {
        if authRepository.readToken() == nil {
            self.isAuthenticated = false
            return
        }
        self.isAuthenticated = true
        if self.user == nil {
            Task {
                do {
                    self.user = try await userRepository.getUser()
                } catch {
                    print("Failed to fetch user: \(error)")
                }
            }
        }
    }
}

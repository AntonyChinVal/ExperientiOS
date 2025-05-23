//
//  AuthRepositoryImpl.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

class AuthRepositoryImpl: AuthRepository {
    private let keychain: KeychainService

    init(keychain: KeychainService) {
        self.keychain = keychain
    }

    func login(username: String, password: String) async -> AuthResponse? {
        guard !username.isEmpty, !password.isEmpty else { return nil }

        // Simulate network delay
        try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)

        return AuthResponse(
            user: User(
                username: "VShah",
                lastName: "Shah",
                firstName: "Viraj",
                displayName: "Viraj Shah",
                emailAddress: "vshah@experient.com"
            ),
            accessToken: "<mocked-access-token>",
            refreshToken: "<mocked-refresh-token>"
        )
    }

    func readToken(key: String) -> String? {
        keychain.read(key: key)
    }

    func saveToken(_ token: String, key: String) {
        keychain.save(token, key: key)
    }

    func deleteToken(key: String) {
        keychain.delete(key: key)
    }
}

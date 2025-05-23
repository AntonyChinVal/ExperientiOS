//
//  AppContainer.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

class AppContainer {
    let keychainService: KeychainService
    let authRepository: AuthRepository

    init() {
        keychainService = KeychainServiceImpl()
        authRepository = AuthRepositoryImpl(keychain: keychainService)
    }
}

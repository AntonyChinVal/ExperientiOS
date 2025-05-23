//
//  AppContainer.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

class AppContainer {
    static func registerServices() {
        DIContainer.shared.register(KeychainService.self) { KeychainServiceImpl() }

        DIContainer.shared.register(NetworkService.self) { NetworkServiceImpl() }
    }

    static func registerRepositories() {
        DIContainer.shared.register(AuthRepository.self) { AuthRepositoryImpl(
            keychain: DIContainer.shared.resolve(KeychainService.self),
            network: DIContainer.shared.resolve(NetworkService.self)
        ) }
        DIContainer.shared.register(UserRepository.self) { UserRepositoryImpl(
            network: DIContainer.shared.resolve(NetworkService.self)
        ) }
    }

    static func registerDependencies() {
        self.registerServices()
        self.registerRepositories()
    }
}

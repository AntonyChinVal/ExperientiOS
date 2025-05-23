//
//  UserRepositoryImpl.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }

    func getUser() async throws -> User {
        let response = try await network.get(url: APIConfig.User.getUser, responseType: User.self)
        return response
    }
}

//
//  UserRepositoryImpl.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let network: NetworkService
    private let getUserEndpoint = URL(string: "https://68302087f504aa3c70f66864.mockapi.io/experient/api/v1/user/1")!

    init(network: NetworkService) {
        self.network = network
    }

    func getUser() async throws -> User {
        let url = getUserEndpoint
        let response = try await network.get(url: url, responseType: User.self)
        return response
    }
}

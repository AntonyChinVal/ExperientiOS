//
//  UserRepository.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//
import Foundation

class UserRepositoryMock: UserRepository {
    var getUserResult: Result<User, Error> = .success(UserMock.sample)

    func getUser() async throws -> User {
        switch getUserResult {
        case .success(let user):
            return user
        case .failure(let error):
            throw error
        }
    }
}

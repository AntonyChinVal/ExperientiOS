//
//  UserRepository.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

protocol UserRepository {
    func getUser() async throws -> User
}

//
//  NetworkService.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation

protocol NetworkService {
    func post<T: Decodable>(
        url: URL,
        body: some Encodable,
        responseType: T.Type
    ) async throws -> T

    func get<T: Decodable>(
        url: URL,
        responseType: T.Type
    ) async throws -> T
}

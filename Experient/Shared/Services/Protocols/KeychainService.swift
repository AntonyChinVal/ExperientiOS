//
//  KeychainService.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

protocol KeychainService {
    func save(_ data: String, key: String)
    func read(key: String) -> String?
    func delete(key: String)
}

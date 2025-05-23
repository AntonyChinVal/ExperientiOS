//
//  KeychainServiceImpl.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Security
import SwiftUI

class KeychainServiceImpl: KeychainService {
    func save(_ data: String, key: String) {
        guard let data = data.data(using: .utf8) else { return }
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: key,
            kSecValueData: data
        ] as CFDictionary

        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    func read(key: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary

        var result: AnyObject?
        if SecItemCopyMatching(query, &result) == errSecSuccess,
           let data = result as? Data,
           let string = String(data: data, encoding: .utf8)
        {
            return string
        }
        return nil
    }

    func delete(key: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: key
        ] as CFDictionary

        SecItemDelete(query)
    }
}

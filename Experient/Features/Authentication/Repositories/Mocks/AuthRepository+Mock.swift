//
//  AuthRepository+Mock.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

class AuthRepositoryMock: AuthRepository {
    var loginResult: AuthResponse?
    var readTokenResult: String?
    var saveTokenCalled = false
    var deleteTokenCalled = false
    
    
    func login(username: String, password: String) async -> AuthResponse? {
        return loginResult
    }
    
    func readToken(key: String) -> String? {
        return readTokenResult
    }
    
    func saveToken(_ token: String, key: String) {
        saveTokenCalled = true
    }
    
    func deleteToken(key: String) {
        deleteTokenCalled = true
    }
}
    



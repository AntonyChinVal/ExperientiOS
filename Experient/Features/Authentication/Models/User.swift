//
//  User.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

struct User: Codable {
    let username, lastName, firstName, displayName, emailAddress: String
}

enum UserMock {
    static let sample = User(
        username: "mockuser",
        lastName: "Doe",
        firstName: "John",
        displayName: "John Doe",
        emailAddress: "john.doe@example.com"
    )
}

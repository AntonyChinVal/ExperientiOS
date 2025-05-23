//
//  App.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI
import Security

@main
struct TestApp: App {
    private let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(AuthViewModel(repository: container.authRepository))
        }
    }
}

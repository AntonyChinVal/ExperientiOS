//
//  App.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Security
import SwiftUI

@main
struct ExperientApp: App {
    let container = DIContainer.shared

    init() {
        AppContainer.registerDependencies()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(AuthViewModel(
                    authRepository: self.container.resolve(AuthRepository.self),
                    userRepository: self.container.resolve(UserRepository.self)
                ))
        }
    }
}

//
//  AppCoordinator.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case home
    case profile
}

final class AppCoordinator: ObservableObject {
    @Published
    var path = NavigationPath()

    func goToHome() {
        self.path.append(Route.home)
    }

    func goToProfile() {
        self.path.append(Route.profile)
    }

    func reset() {
        self.path = NavigationPath()
    }
}

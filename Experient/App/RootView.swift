//
//  RootView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct RootView: View {
    @StateObject
    var coordinator = AppCoordinator()

    @EnvironmentObject
    var auth: AuthViewModel

    @EnvironmentObject
    var toast: ToastManager

    @EnvironmentObject
    var alert: AlertManager

    var body: some View {
        NavigationStack(path: self.$coordinator.path) {
            Group {
                if self.auth.isAuthenticated {
                    HomeView()
                } else {
                    LoginView()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .home:
                    HomeView()
                case .profile:
                    ProfileView()
                }
            }
        }
        .environmentObject(self.coordinator)
        .onChange(of: self.auth.isAuthenticated) {
            if !self.auth.isAuthenticated {
                self.coordinator.reset()
            }
        }
        .toast(isPresented: toast.isVisible, message: toast.message)
        .alertOverlay(manager: alert)
    }
}

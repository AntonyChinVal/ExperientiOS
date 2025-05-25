//
//  RootView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var auth: AuthViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    @EnvironmentObject private var toast: ToastManager
    @EnvironmentObject private var alert: AlertManager

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            content
                .navigationDestination(for: Route.self, destination: destinationView)
        }
        .environmentObject(coordinator)
        .onChange(of: self.auth.isAuthenticated) {
            if !self.auth.isAuthenticated {
                self.coordinator.reset()
            }
        }
        .toast(isPresented: toast.isVisible, message: toast.message)
        .alertOverlay(manager: alert)
    }

    @ViewBuilder
    private var content: some View {
        if auth.isAuthenticated {
            HomeView()
        } else {
            LoginView()
        }
    }

    @ViewBuilder
    private func destinationView(for route: Route) -> some View {
        switch route {
        case .home:
            HomeView()
        case .profile:
            ProfileView()
        }
    }
}

//
//  HomeView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject
    var coordinator: AppCoordinator
    @EnvironmentObject
    var auth: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(self.auth.user?.displayName ?? "")")
                .font(AppTheme.Typography.medium1)
            Button("Profile") {
                self.coordinator.goToProfile()
            }.buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.secondary))
            Button("Logout") {
                self.auth.logout()
            }
            .buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.primary))
        }
        .padding()
        .navigationTitle("Home")
    }
}

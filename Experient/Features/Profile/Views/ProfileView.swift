//
//  ProfileView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject
    var auth: AuthViewModel

    @EnvironmentObject
    var toast: ToastManager

    @EnvironmentObject
    var alert: AlertManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to your profile, \(self.auth.user?.displayName ?? "")")
                .font(AppTheme.Typography.medium1)
            Button("Refres Token Success") {
                self.auth.refreshToken(isSuccess: true)
                toast.show(message: "Token Refreshed Successfully")
            }.buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.secondary))
            Button("Refresh Token Error") {
                self.auth.refreshToken(isSuccess: false)
                alert.show(title: "Session Expired", message: "Please log in again.")
            }
            .buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.primary))
        }
        .padding()
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel(
            authRepository: DIContainer.shared.resolve(AuthRepository.self),
            userRepository: DIContainer.shared.resolve(UserRepository.self)
        ))
        .environmentObject(ToastManager())
        .environmentObject(AlertManager())
}

//
//  HomeView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(auth.user?.displayName ?? "")")
                .font(AppTheme.Typography.medium1)

            NavigationLink("Go to Profile", destination: ProfileView())
                .buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.secondary))

            Button("Logout") {
                auth.logout()
            }
            .buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.primary))
        }
        .padding()
        .navigationTitle("Home")
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthViewModel(repository: AuthRepositoryMock()))
            .preferredColorScheme(.light)
    }
}

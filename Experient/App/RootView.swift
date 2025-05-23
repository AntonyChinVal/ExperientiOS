//
//  RootView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        NavigationStack {
            if auth.isAuthenticated {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

//
//  LoginView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct LoginView: View {
    @State
    private var username = ""
    @State
    private var password = ""
    @EnvironmentObject
    var auth: AuthViewModel

    var body: some View {
        let isFormValid = !self.username.isEmpty && !self.password.isEmpty
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    ScrollView {
                        VStack(spacing: 16) {
                            TextField("Username", text: self.$username)
                                .textFieldStyle(AppTheme.TextFields.defaultStyle)
                                .padding(.horizontal)

                            SecureField("Password", text: self.$password)
                                .textFieldStyle(AppTheme.TextFields.defaultStyle)
                                .padding(.horizontal)
                        }
                        .frame(maxWidth: 400)
                        .padding(.top, 50)
                    }

                    Spacer()
                    Button("Login") {
                        self.auth.login(username: self.username, password: self.password)
                    }
                    .disabled(!isFormValid)
                    .buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.primary, isEnabled: isFormValid))
                    .frame(maxWidth: 400)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }

            if self.auth.isLoading {
                LoadingOverlay()
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationTitle("Login")
    }
}

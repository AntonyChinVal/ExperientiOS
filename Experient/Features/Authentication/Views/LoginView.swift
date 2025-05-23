//
//  LoginView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @EnvironmentObject var auth: AuthViewModel

    var body: some View {
        let isFormValid = !username.isEmpty && !password.isEmpty
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    ScrollView {
                        VStack(spacing: 16) {
                            TextField("Username", text: $username)
                                .textFieldStyle(AppTheme.TextFields.defaultStyle)
                                .padding(.horizontal)

                            SecureField("Password", text: $password)
                                .textFieldStyle(AppTheme.TextFields.defaultStyle)
                                .padding(.horizontal)
                        }
                        .frame(maxWidth: 400)
                        .padding(.top, 50)
                    }

                    Spacer()
                    Button("Login") {
                        auth.login(username: username, password: password)
                    }
                    .disabled(!isFormValid)
                    .buttonStyle(ThemedButtonStyle(configuration: AppTheme.Buttons.primary, isEnabled: isFormValid
                                                  ))
                    .frame(maxWidth: 400)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }

            if auth.isLoading {
                LoadingOverlay()
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel(repository: AuthRepositoryMock()))
            .preferredColorScheme(.light)
    }
}

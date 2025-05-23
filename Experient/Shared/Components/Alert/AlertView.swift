//
//  AlertView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct AlertView: View {
    let title: String
    let message: String
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)

            Button("OK") {
                onDismiss()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 10)
        .frame(maxWidth: 300)
        .padding()
    }
}

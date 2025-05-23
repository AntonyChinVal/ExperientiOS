//
//  LoadingOverlay.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct LoadingOverlay: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            ProgressView("Logging in...")
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
        }
        .transition(.opacity)
        .animation(.easeInOut, value: UUID())
    }
}

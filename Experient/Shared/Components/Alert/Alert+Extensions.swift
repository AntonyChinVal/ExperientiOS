//
//  Alert+Extensions.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

extension View {
    func alertOverlay(manager: AlertManager) -> some View {
        ZStack {
            self

            if manager.isVisible {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                AlertView(
                    title: manager.title,
                    message: manager.message,
                    onDismiss: { manager.dismiss() }
                )
                .transition(.scale)
                .animation(.easeInOut, value: manager.isVisible)
            }
        }
    }
}

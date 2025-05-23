//
//  AlertManager.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation
import SwiftUI

final class AlertManager: ObservableObject {
    @Published var title: String = ""
    @Published var message: String = ""
    @Published var isVisible: Bool = false
    var onDismiss: (() -> Void)?

    func show(title: String, message: String, onDismiss: (() -> Void)? = nil) {
        self.title = title
        self.message = message
        self.onDismiss = onDismiss
        self.isVisible = true
    }

    func dismiss() {
        self.isVisible = false
        self.onDismiss?()
    }
}

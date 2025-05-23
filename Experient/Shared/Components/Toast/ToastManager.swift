//
//  ToastManager.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import Foundation
import SwiftUI

final class ToastManager: ObservableObject {
    @Published var message: String = ""
    @Published var isVisible: Bool = false

    private var hideWorkItem: DispatchWorkItem?

    func show(message: String, duration: TimeInterval = 2.0) {
        self.message = message
        self.isVisible = true

        hideWorkItem?.cancel()

        let task = DispatchWorkItem { [weak self] in
            self?.isVisible = false
            self?.message = ""
        }

        hideWorkItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: task)
    }
}

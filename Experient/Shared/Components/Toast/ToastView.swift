//
//  ToastView.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.85))
            .cornerRadius(12)
            .padding(.bottom, 40)
            .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

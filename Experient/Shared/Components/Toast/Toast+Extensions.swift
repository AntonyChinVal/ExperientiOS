//
//  Toast+Extensions.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

extension View {
    func toast(isPresented: Bool, message: String) -> some View {
        ZStack {
            self
            if isPresented {
                VStack {
                    Spacer()
                    ToastView(message: message)
                }
                .transition(.opacity)
                .animation(.easeInOut, value: isPresented)
            }
        }
    }
}

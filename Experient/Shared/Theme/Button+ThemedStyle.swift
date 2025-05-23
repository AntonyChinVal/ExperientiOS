//
//  Button+ThemedStyle.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct ButtonStyleConfiguration {
    let backgroundColor: Color
    let foregroundColor: Color
    let disabledBackgroundColor: Color
    let disabledForegroundColor: Color

    init(
        backgroundColor: Color,
        foregroundColor: Color,
        disabledBackgroundColor: Color = Color.gray.opacity(0.3),
        disabledForegroundColor: Color = Color.white.opacity(0.6)
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.disabledForegroundColor = disabledForegroundColor
    }
}


struct ThemedButtonStyle: ButtonStyle {
    var configuration: ButtonStyleConfiguration
    var isEnabled: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isEnabled ? self.configuration.backgroundColor : self.configuration.disabledBackgroundColor)
            .foregroundColor(isEnabled ? self.configuration.foregroundColor : self.configuration.disabledForegroundColor)
            .cornerRadius(8)
            .opacity(isEnabled ? 1.0 : 0.6)
            .scaleEffect(configuration.isPressed && isEnabled ? 0.96 : 1.0)
    }
}

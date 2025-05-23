//
//  TextField+ThemedStyle.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUI

struct ThemedTextFieldStyle: TextFieldStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    var padding: EdgeInsets

    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(self.padding)
            .background(self.backgroundColor)
            .foregroundColor(self.foregroundColor)
            .cornerRadius(self.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}

//
//  AppTheme.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

import SwiftUICore
import UIKit

struct AppTheme {
    struct Typography {
        static let body1 = Font.system(size: 16)
        static let body2 = Font.system(size: 14)
        static let medium1 = Font.system(size: 16, weight: .medium)
        static let medium2 = Font.system(size: 14, weight: .medium)
    }

    struct Buttons {
        static let primary = ButtonStyleConfiguration(
            backgroundColor: .blue,
            foregroundColor: .white
        )

        static let secondary = ButtonStyleConfiguration(
            backgroundColor: .gray,
            foregroundColor: .white
        )
    }
    
    struct TextFields {
        static let defaultStyle = ThemedTextFieldStyle(
            backgroundColor: Color(UIColor.secondarySystemBackground),
            foregroundColor: .primary,
            cornerRadius: 10,
            padding: EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12)
        )
    }
}

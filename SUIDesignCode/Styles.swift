//
//  Styles.swift
//  SUIDesignCode
//
//  Created by Evhenii Mahlena on 01.06.2022.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .stroke(
                LinearGradient(
                    colors: [
                        .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                        .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                    ], startPoint: .top, endPoint: .bottom
                )
            )
            .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(_ cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}

//
//  PreferenceKeys.swift
//  SUIDesignCode
//
//  Created by Evhenii Mahlena on 05.06.2022.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

//
//  Tab.swift
//  SUIDesignCode
//
//  Created by Evhenii Mahlena on 01.06.2022.
//

import SwiftUI

struct TabItem: Identifiable {
    
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}
var tabItems = [
    TabItem(text: "Learn Now", icon: "house", tab: .home),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore),
    TabItem(text: "Notifications", icon: "bell", tab: .notifications),
    TabItem(text: "Library", icon: "rectangle.stack", tab: .library)


]

enum Tab: String {
    case home
    case explore
    case notifications
    case library
    
}

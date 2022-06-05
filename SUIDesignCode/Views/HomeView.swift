//
//  HomeView.swift
//  SUIDesignCode
//
//  Created by Evhenii Mahlena on 01.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasScrolled = false
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            FeaturedItem()
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            if value < 0 {
                hasScrolled = true
            } else {
                hasScrolled = false
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 80)
        })
        .overlay(
            NavigationBar(title: "Featured")
                .opacity(hasScrolled ? 1 : 0)
        )
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

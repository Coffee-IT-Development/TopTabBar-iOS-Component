//
//  ContentView.swift
//  CITTopTabBarRunnable
//
//  Created by Lex Brouwers on 11/07/2022.
//

import SwiftUI
import CITTopTabBar

struct ContentView: View {
    @State var selectedTab: Int = 0
    @State var tabs: [CITTopTab] = [
        .init(title: "Long Example", badge: .circle(style: .init(color: .red))),
        .init(title: "Books"),
        .init(title: "Sports", badge: .circle(style: .init(color: .green, position: .leading))),
        .init(title: "Series"),
        .init(title: "Films"),
        .init(title: "Fun"),
        .init(title: "Settings"),
        .init(title: "Library"),
        .init(title: "Example"),
    ]
    
    var body: some View {
        VStack {
            CITTopTabBarView(selectedTab: $selectedTab, tabs: $tabs, config: .exampleUnderlined)
            
            TabView(selection: $selectedTab) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { offset, tab in
                    Text(tab.title).tag(offset)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

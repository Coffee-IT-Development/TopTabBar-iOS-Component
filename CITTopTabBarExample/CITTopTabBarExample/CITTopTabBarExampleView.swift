//
//  CITTopTabBarExampleView.swift
//  CITTopTabBarExample
//
//  Created by Lex Brouwers on 02/08/2022.
//  Copyright © 2022 Coffee IT. All rights reserved.
//

import SwiftUI
import CITTopTabBar

struct CITTopTabBarExampleView: View {
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

struct CITTopTabBarExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CITTopTabBarExampleView()
    }
}

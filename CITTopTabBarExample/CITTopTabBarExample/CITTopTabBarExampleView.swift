//
//  CITTopTabBarExampleView.swift
//  CITTopTabBarExample
//
//  MIT License
//
//  Copyright (c) 2022 Coffee IT
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import CITTopTabBar
import SwiftUI

struct CITTopTabBarExampleView: View {
    @State var selectedTab: Int = 0
    @State var tabs: [CITTopTab] = [
        .init(
            title: "Long Example",
            icon: .init(systemName: "airplane.departure"),
            iconColorOverride: .blue.opacity(0.5),
            selectedIconColorOverride: .blue,
            badge: .circle(style: .init(color: .blue)),
            removeBadgeOnTabSelected: true
        ),
        .init(title: "Books", icon: .init(systemName: "shield")),
        .init(
            title: "Sports",
            icon: .init(systemName: "key.viewfinder"),
            badge: .circle(style: .init(color: .green, position: .leading)),
            removeBadgeOnTabSelected: true
        ),
        .init(title: "Series", icon: .init(systemName: "person.badge.key")),
        .init(
            title: "Films",
            icon: .init(systemName: "dots.and.line.vertical.and.cursorarrow.rectangle"),
            badge: .circle(style: .init(color: .yellow, position: .trailing)),
            removeBadgeOnTabSelected: true
        ),
        .init(title: "Fun", icon: .init(systemName: "lasso.and.sparkles")),
        .init(title: "Settings", icon: .init(systemName: "gamecontroller")),
        .init(title: "Library"),
        .init(title: "Example"),
    ]
    
    var body: some View {
        VStack {
            CITTopTabBarView(selectedTab: $selectedTab, tabs: $tabs, config: .examplePillShapedWithInset)
            
            TabView(selection: $selectedTab) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { offset, tab in
                    Text(tab.title).tag(offset)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color.red)
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CITTopTabBarExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CITTopTabBarExampleView()
    }
}

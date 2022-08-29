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
            title: "Flight Departure",
            icon: .init(systemName: "airplane.departure")
        ),
        .init(title: "Shield", icon: .init(systemName: "shield")),
        .init(
            title: "Keyfinder",
            icon: .init(systemName: "key.viewfinder"),
            iconColorOverride: .orange.opacity(0.5),
            selectedIconColorOverride: .orange
        ),
        .init(
            title: "Keyholder",
            icon: .init(systemName: "person.badge.key"),
            badge: .circle(style: .init(color: .tabBarTextColor, position: .leading)),
            removeBadgeOnTabSelected: true
        ),
        .init(
            title: "Films",
            icon: .init(systemName: "film"),
            badge: .circle(style: .init(color: .tabBarTextColor, position: .trailing))
        ),
        .init(title: "Lasso", icon: .init(systemName: "lasso.and.sparkles")),
        .init(title: "Gaming", icon: .init(systemName: "gamecontroller")),
        .init(title: "Library", icon: .init(systemName: "books.vertical")),
        .init(title: "Questions", icon: .init(systemName: "questionmark.app.dashed"))
    ]
    
    var config: CITTopTabBarView.Configuration {
        var example: CITTopTabBarView.Configuration = .examplePillShapedWithInset
        example.textColor = .tabBarTextColor
        example.backgroundColor = .tabBarBackgroundColor
        return example
    }
    
    var body: some View {
        VStack {
            CITTopTabBarView(selectedTab: $selectedTab, tabs: $tabs, config: config)
            
            TabView(selection: $selectedTab) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { offset, tab in
                    Text(tab.title)
                        .font(.system(size: 16, weight: .bold))
                        .tag(offset)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color.coffeeItColor)
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CITTopTabBarExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CITTopTabBarExampleView()
    }
}

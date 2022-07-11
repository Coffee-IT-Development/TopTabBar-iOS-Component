//
//  CITTopTabBarContentView.swift
//  
//
//  Created by Lex Brouwers on 30/06/2022.
//

import SwiftUI

public struct CITTopTabBarContentView: View {
    @State private var selectedTab: Int = 0

    @State private var tabs: [CITTopTab] = [
        .init(title: "Music"),
        .init(title: "Movies"),
        .init(title: "Books"),
        .init(title: "Music"),
        .init(title: "Movies"),
        .init(title: "Books"),
        .init(title: "Music"),
        .init(title: "Movies"),
        .init(title: "Books")
    ]

    public init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }

    public var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    
                    CITTopTabBarView(selectedTab: $selectedTab, tabs: $tabs, config: .example)
//                    // Tabs
//                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)

                    // Views
                    TabView(selection: $selectedTab,
                            content: {
                                Text("Hey 1")
                                    .tag(0)
                                Text("Hey 2")
                                    .tag(1)
                                Text("Hey 3")
                                    .tag(2)
                            })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("TabsSwiftUIExample")
                .ignoresSafeArea()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CITTopTabBarContentView()
    }
}

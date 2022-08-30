//
//  CITTopTabBarView.swift
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

import SwiftUI

/// The CITTopTabBarView provides a top tab bar interface with deep customisation through its config.
/// It includes support for an animated underline, insets and a background color for selected items.
/// Has a separate mode to make displaying the component at the top of the view easy.
/// The tab bar is horizontally scrollable, but tries to keep the selected tab loyal to the center of the screen.
/// Works well with a page style TabView to display content.
public struct CITTopTabBarView: View {
    @Namespace private var namespace
    @Binding private var selectedTab: Int
    @Binding private var tabs: [CITTopTab]
    private var config: CITTopTabBarView.Configuration
    
    @State private var safeTopInsetNegation: CGFloat = 0
    @State private var greatestBackgroundHeight: CGFloat = 0
    
    private var doesAnyTabHaveIcon: Bool {
        !tabs.allSatisfy { $0.icon == nil }
    }
    
    /// Intialise the top tab bar view with bindings for the selectedTab and tab objects and add a config of your choice, you can use .example configs to try out the component.
    /// - Parameters:
    ///   - selectedTab: Int binding for the selected tab index, updated automatically and may be changed to manually switch tabs.
    ///   - tabs: Binding of an array of tabs you'd like to display, tabs can be added or removed at runtime if desired.
    ///   - config: The config used to customize the tab bar view to your liking, includes static examples.
    public init(
        selectedTab: Binding<Int>,
        tabs: Binding<[CITTopTab]>,
        config: CITTopTabBarView.Configuration
    ) {
        self._selectedTab = selectedTab
        self._tabs = tabs
        self.config = config
    }
    
    public var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, item in
                        CITTopTabView(
                            index: index,
                            item: item,
                            config: config,
                            doesAnyTabHaveIcon: doesAnyTabHaveIcon,
                            namespace: namespace,
                            selectedTab: $selectedTab,
                            greatestBackgroundHeight: $greatestBackgroundHeight
                        )
                        .id(index)
                    }
                }
                .padding(.top, config.ignoreSafeEdgeTopPadding)
                .padding(config.tabBarInsets)
                .background(
                    config.backgroundColor
                        .padding(.horizontal, -UIScreen.main.bounds.width)
                )
                .onChange(of: selectedTab) { tab in
                    withAnimation {
                        value.scrollTo(tab, anchor: .center)
                    }
                }
            }
        }
        .optionalIgnoreEdges(edges: .top, active: config.showAtTopOfScreen)
        .padding(.bottom, -safeTopInsetNegation)
        .background(
            GeometryReader { proxy in
                Color.clear.onAppear {
                    if config.showAtTopOfScreen {
                        safeTopInsetNegation = proxy.safeAreaInsets.top
                    }
                }
            }
        )
    }
}

public struct CITTopTabBarView_Previews: PreviewProvider {
    private struct CITTopTabBarPreview: View {
        @State private var selectedTab: Int = 0
        
        var body: some View {
            VStack {
                CITTopTabBarView(selectedTab: $selectedTab, tabs: .constant([
                    .init(title: "Long Example"),
                    .init(title: "Movies"),
                    .init(title: "Books"),
                    .init(title: "Sports"),
                    .init(title: "Series"),
                    .init(title: "Films"),
                    .init(title: "Fun"),
                ]), config: .exampleUnderlined)
                
                Spacer()
            }
        }
    }
    
    public static var previews: some View {
        CITTopTabBarPreview()
    }
}

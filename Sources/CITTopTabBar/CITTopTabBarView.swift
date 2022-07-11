//
//  CITTopTabBarView.swift
//  
//
//  Created by Lex Brouwers on 30/06/2022.
//

import SwiftUI

public struct CITTopTabBarView: View {
    @Namespace var namespace
    @Binding var selectedTab: Int
    @Binding var tabs: [CITTopTab]
    private var config: CITTopTabBarConfig
    
    public init(
        selectedTab: Binding<Int>,
        tabs: Binding<[CITTopTab]>,
        config: CITTopTabBarConfig
    ) {
        self._selectedTab = selectedTab
        self._tabs = tabs
        self.config = config
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, item in
                    navBarItem(index, item)
                }
            }
            .padding(.top, config.topPadding)
            .background(
                config.backgroundColor
                    .padding(.horizontal, -UIScreen.main.bounds.width)
            )
        }
        .optionalIgnoreEdges(edges: .top, active: config.showAtTopOfScreen)
    }
    
    private func navBarItem(_ index: Int, _ item: CITTopTab) -> some View {
        Button {
            selectedTab = index
        } label: {
            VStack {
                tabContent(for: item)
                optionalIndicator(at: index)
            }
            .animation(.spring(), value: $selectedTab.wrappedValue)
        }
        .buttonStyle(.plain)
    }
}

struct CITTopTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CITTopTabBarView(selectedTab: .constant(0), tabs: .constant([
                .init(title: "Long Example"),
                .init(title: "Movies"),
                .init(title: "Books"),
                .init(title: "Sports"),
                .init(title: "Series"),
                .init(title: "Films"),
                .init(title: "Fun"),
            ]), config: .example)
            
            Spacer()
        }
    }
}

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
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, item in
                        CITTopTabView(
                            index: index,
                            item: item,
                            config: config,
                            namespace: namespace,
                            selectedTab: $selectedTab
                        )
                        .id(index)
                    }
                }
                .padding(.top, config.topPadding)
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

//
//  CITTopTabBarView.swift
//  
//
//  Created by Lex Brouwers on 30/06/2022.
//

import SwiftUI

public struct CITTopTabBarView: View {
    @Namespace private var animation
    @Binding var selectedTab: Int
    @Binding var tabs: [CITTopTab]
    
    public init(selectedTab: Binding<Int>, tabs: Binding<[CITTopTab]>) {
        self._selectedTab = selectedTab
        self._tabs = tabs
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 0) {
                ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, item in
                    Button(action: { selectTab(index) }) {
                        VStack(spacing: 0) {
                            Text(item.title)
                                .padding()
                            
                            optionalSelector(at: index)
                                .animation(.easeOut(duration: 0.2))
                        }
                    }
                }
            }
            .background(Color(UIColor.systemGray5))
//            .animation(.easeOut(duration: 0.2))
        }
    }
    
    
    @ViewBuilder
    private func optionalSelector(at index: Int) -> some View {
        if selectedTab == index {
            Color.red
                .frame(height: 5)
                .cornerRadius(.infinity)
                .matchedGeometryEffect(id: "indicator", in: animation)
                .animation(.easeOut(duration: 2))
        } else {
            Color.clear
                .frame(height: 5)
                .animation(.easeOut(duration: 4))
        }
    }
    
    private func selectTab(_ index: Int) {
        print("[TEST] Set selected tab to \(index)")
        selectedTab = index
    }
}

struct CITTopTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CITTopTabBarView(selectedTab: .constant(0), tabs: .constant([
            .init(title: "Long Example"),
            .init(title: "Movies"),
            .init(title: "Books"),
            .init(title: "Music"),
            .init(title: "Movies"),
            .init(title: "Books"),
            .init(title: "Music"),
            .init(title: "Movies"),
            .init(title: "Books")
        ]))
    }
}

//
//  CITTopTabBarView.swift
//  
//
//  Created by Lex Brouwers on 30/06/2022.
//

import SwiftUI

public struct CITTopTabBarView: View {
    @Namespace private var namespace
    @Binding var selectedTab: Int
    @Binding var tabs: [CITTopTab]
    
    public init(selectedTab: Binding<Int>, tabs: Binding<[CITTopTab]>) {
        self._selectedTab = selectedTab
        self._tabs = tabs
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, item in
                    navBarItem(index, item)
                }
            }
            .padding(.top, 60)
            .background(
                Color(UIColor.systemGray5)
                    .padding(.horizontal, -UIScreen.main.bounds.width)
            )
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    private func navBarItem(_ index: Int, _ item: CITTopTab) -> some View {
        Button {
            selectedTab = index
        } label: {
            VStack {
                Text(item.title)
                    .font(.system(size: 13, weight: .light, design: .default))
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                
                if selectedTab == index {
                    Color.red
                        .frame(height: 2)
                        .cornerRadius(.infinity)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear
                        .frame(height: 2)
                }
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
            ]))
            
            Spacer()
        }
    }
}

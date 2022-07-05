//
//  CITTopTabBarView.swift
//  
//
//  Created by Lex Brouwers on 30/06/2022.
//

import SwiftUI

public struct CITTopTabBarView: View {
    @Binding var selectedTab: Int
    @Binding var tabs: [Tab]
    
    public init(selectedTab: Binding<Int>, tabs: Binding<[Tab]>) {
        self._selectedTab = selectedTab
        self._tabs = tabs
    }
    
    public var body: some View {
        ScrollView(.horizontal) {
            Button(action: {
                selectTab(3)
            }) {
                Text("Try me")
            }
            
            HStack(alignment: .center, spacing: 0) {
                ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, item in
                    Button(action: { selectTab(index) }) {
                        Text(item.title)
                            .padding()
                            .overlay(
                                optionalSelector(at: index)
                            )
                    }
                }
            }
        }
        .background(Color(UIColor.systemGray5))
    }
    
    @ViewBuilder
    private func optionalSelector(at index: Int) -> some View {
        if selectedTab == index {
            VStack {
                Spacer()
                Color.red
                    .frame(height: 5)
                    .cornerRadius(.infinity)
            }
            .allowsHitTesting(false)
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
            .init(icon: Image(systemName: "music.note"), title: "Music"),
            .init(icon: Image(systemName: "film.fill"), title: "Movies"),
            .init(icon: Image(systemName: "book.fill"), title: "Books"),
            .init(icon: Image(systemName: "music.note"), title: "Music"),
            .init(icon: Image(systemName: "film.fill"), title: "Movies"),
            .init(icon: Image(systemName: "book.fill"), title: "Books"),
            .init(icon: Image(systemName: "music.note"), title: "Music"),
            .init(icon: Image(systemName: "film.fill"), title: "Movies"),
            .init(icon: Image(systemName: "book.fill"), title: "Books")
        ]))
    }
}

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
    
    
//    public var body: some View {
//        VStack(spacing: 0) {
//            navigationBarView
//
//            TabView(selection: self.$selectedTab, content: {
//                view1.tag(0)
//                view2.tag(1)
//                view3.tag(2)
//            })
//            .tabViewStyle(.page(indexDisplayMode: .never))
//            .edgesIgnoringSafeArea(.all)
//        }
//    }
    
    var navigationitems: [String] = ["Hello World", "This is", "A Pretty Cool Tab Bar"]
    
    var navigationBarView: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .bottom, spacing: 20) {
                ForEach(Array(zip(self.navigationitems.indices, self.navigationitems)), id: \.0, content: {
                    index, name in
                    navBarItem(string: name, tab: index)
                })
            }
            .padding(.horizontal)
            .edgesIgnoringSafeArea(.top)
        }
        .background(Color.white)
    }
    
    
    func navBarItem(string: String, tab: Int) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack {
                Text(string)
                    .font(.system(size: 13, weight: .light, design: .default))
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                
                if selectedTab == tab {
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
    
    

    
    public var body: some View {
//        VStack(spacing: 0) {
//            Color(UIColor.systemGray5)
            tabBar
//        }
//        .edgesIgnoringSafeArea(.top)
    }
    
    var tabBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 0) {
                ForEach(Array(zip(tabs.indices, tabs)), id: \.0) { index, item in
                    navBarItem(string: item.title, tab: index)
                    
                    
//                    Button(action: { selectTab(index) }) {
//                        VStack(spacing: 0) {
//                            Text(item.title)
//                                .padding()
//
////                            optionalSelector(at: index)
//                        }
//                        .animation(.spring(), value: $selectedTab.wrappedValue)
//                    }
                }
            }
            .padding(.top, 60)
            .background(
                Color(UIColor.systemGray5).padding(.horizontal, -UIScreen.main.bounds.width)
            )
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    
//    @ViewBuilder
//    private func optionalSelector(at index: Int) -> some View {
//        if selectedTab == index {
//            Color.red
//                .frame(height: 5)
//                .cornerRadius(.infinity)
//                .matchedGeometryEffect(id: "underline", in: namespace)
//                .animation(.easeOut(duration: 2))
//        } else {
//            Color.clear
//                .frame(height: 5)
//                .animation(.easeOut(duration: 4))
//        }
//    }
    
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
            .init(title: "Sports"),
            .init(title: "Series"),
            .init(title: "Films"),
            .init(title: "Fun"),
        ]))
    }
}

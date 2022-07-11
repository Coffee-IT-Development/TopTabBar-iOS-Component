//
//  CITTopTabBarSimpleExample.swift
//  
//
//  Created by Lex Brouwers on 05/07/2022.
//

import SwiftUI

struct CITTopTabBarSimpleExample: View {
    @State private var selectedTab = 0
    @State private var tabs = [
        CITTopTab(title: "One"),
        CITTopTab(title: "Two"),
        CITTopTab(title: "Three WOAH"),
        CITTopTab(title: "Four"),
        CITTopTab(title: "Five"),
        CITTopTab(title: "Six"),
        CITTopTab(title: "Seven"),
        CITTopTab(title: "Eight")
    ]
    
    var body: some View {
        VStack {
            Text("Selected: \(selectedTab)")
            
            CITTopTabBarView(selectedTab: $selectedTab, tabs: $tabs, config: .example)
            Spacer()
        }
    }
}

struct CITTopTabBarSimpleExample_Previews: PreviewProvider {
    static var previews: some View {
        CITTopTabBarSimpleExample()
    }
}

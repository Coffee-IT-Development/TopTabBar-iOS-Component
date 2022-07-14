//
//  CITTopTabView.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//

import SwiftUI

struct CITTopTabView: View {
    let index: Int
    let item: CITTopTab
    let config: CITTopTabBarConfig
    let namespace: Namespace.ID
    @Binding var selectedTab: Int
    
    @State private var calcHeight: CGFloat = 0
    
    var body: some View {
        Button {
            selectedTab = index
        } label: {
            ZStack {
                optionalBackground
                
                VStack {
                    content
                    optionalIndicator
                }
            }
            .animation(.spring(), value: $selectedTab.wrappedValue)
            .background(reader)
        }
        .buttonStyle(.plain)
    }
    
    var content: some View {
        Text(item.title)
            .font(config.font)
            .foregroundColor(.white)
            .colorMultiply(textColor)
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .animation(.easeInOut(duration: 0.3))
    }
    
    @ViewBuilder
    var optionalIndicator: some View {
        if isSelected {
            Color.red
                .frame(height: 2)
                .cornerRadius(.infinity)
                .matchedGeometryEffect(id: "indicator", in: namespace, properties: .frame)
        } else {
            Color.clear
                .frame(height: 2)
        }
    }
    
    @ViewBuilder
    var optionalBackground: some View {
        if isSelected {
            config.selectedBackgroundColor
                .frame(height: calcHeight)
                .matchedGeometryEffect(id: "background", in: namespace)
        }
    }
    
    var reader: some View {
        GeometryReader { proxy in
            Color.clear
                .onAppear {
                    calcHeight = proxy.size.height
                }
        }
    }
}

extension CITTopTabView {
    var isSelected: Bool {
        index == selectedTab
    }
    
    var textColor: Color {
        isSelected ? config.selectedTextColor : config.textColor
    }
}

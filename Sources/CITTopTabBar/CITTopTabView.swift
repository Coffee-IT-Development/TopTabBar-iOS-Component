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
                    optionalUnderline
                }
                .padding(isSelected ? config.selectedInsets : .zero)
            }
            .animation(.spring(), value: $selectedTab.wrappedValue)
            .background(reader)
            .contentShape(Rectangle())
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
    var optionalUnderline: some View {
        if isSelected && config.showUnderline {
            Color.red
                .frame(height: 2)
                .cornerRadius(.infinity)
                .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                .padding(config.underlineInsets)
        } else {
            Color.clear
                .frame(height: 2)
                .padding(config.underlineInsets)
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
                    calcHeight = isSelected ? proxy.size.height : proxy.size.height + config.verticalSelectedInset
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

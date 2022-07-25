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
                optionalFullSizeBackground
                
                VStack(spacing: 0) {
                    ZStack {
                        optionalContentBackground
                        content
                            .padding(config.contentInsets)
                            .background(optionalContentSizeReader)
                    }
                    optionalUnderline
                }
                .padding(isSelected ? config.selectedInsets : .zero)
            }
            .animation(.spring(), value: $selectedTab.wrappedValue)
            .background(optionalFullSizeReader)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(item.title)
    }
    
    var content: some View {
        HStack(spacing: config.titleToBadgeSpacing) {
            if let badge = item.badge, badge.style.position == .leading {
                CITNotificationBadgeView(badge: badge)
            }
            
            Text(item.title)
                .font(config.font)
                .foregroundColor(.white)
                .colorMultiply(textColor)
                .animation(.easeInOut(duration: 0.3)) // TODO: Allow change text animation?
            
            if let badge = item.badge, badge.style.position == .trailing {
                CITNotificationBadgeView(badge: badge)
            }
        }
    }
    
    @ViewBuilder
    var optionalUnderline: some View {
        if isSelected && config.showUnderline {
            config.underlineColor
                .frame(height: config.underlineHeight)
                .cornerRadius(config.underlineCornerRadius)
                .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                .padding(config.underlineInsets)
        } else {
            Color.clear
                .frame(height: config.underlineHeight)
                .padding(config.underlineInsets)
        }
    }
    
    @ViewBuilder
    var optionalFullSizeBackground: some View {
        if config.showUnderline {
            optionalBackground
        }
    }
    
    
    @ViewBuilder
    var optionalContentBackground: some View {
        if !config.showUnderline {
            optionalBackground
        }
    }
    
    @ViewBuilder
    var optionalBackground: some View {
        if isSelected {
            config.selectedBackgroundColor
                .frame(height: calcHeight)
                .cornerRadius(config.backgroundCornerRadius)
                .padding(config.backgroundInsets)
                .matchedGeometryEffect(id: "background", in: namespace)
        }
    }
    
    @ViewBuilder
    var optionalFullSizeReader: some View {
        if config.showUnderline {
            reader
        }
    }
    
    @ViewBuilder
    var optionalContentSizeReader: some View {
        if !config.showUnderline {
            reader
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

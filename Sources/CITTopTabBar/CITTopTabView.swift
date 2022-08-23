//
//  CITTopTabView.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//  Copyright © 2022 Coffee IT. All rights reserved.
//

import SwiftUI

/// The CITTopTabView is not meant for direct use. Please use the CITTopTabBarView for optimal results.
/// Mulitple instances of CITTopTabView will be displayed based on the amount of tabs passed to the CITTopTabBarView.
/// This class is still made public so it can be previewed using the Canvas if desired.
public struct CITTopTabView: View {
    public let index: Int
    public let item: CITTopTab
    public let config: CITTopTabBarView.Configuration
    public let namespace: Namespace.ID
    @Binding public var selectedTab: Int
    
    @State private var calcHeight: CGFloat = 0
    
    var isSelected: Bool {
        index == selectedTab
    }
    
    var textColor: Color {
        isSelected ? config.selectedTextColor : config.textColor
    }
    
    public var body: some View {
        Button {
            selectedTab = index
        } label: {
            ZStack {
                optionalFullSizeBackground
                
                VStack(spacing: 0) {
                    ZStack {
                        optionalContentBackground
                        content
                            .padding(config.tabContentInsets)
                            .background(optionalContentSizeReader)
                    }
                    optionalUnderline
                }
                .padding(isSelected ? config.selectedInsets : CITEdgeInsets.zero)
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
                .animation(.easeInOut(duration: 0.3))
            
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
                .cornerRadius(config.selectedBackgroundCornerRadius)
                .padding(config.selectedBackgroundInsets)
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

public struct CITTopTabView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    public static var previews: some View {
        CITTopTabView(index: 0, item: .init(title: "Tab One"), config: .examplePillShaped, namespace: namespace, selectedTab: .constant(0))
    }
}

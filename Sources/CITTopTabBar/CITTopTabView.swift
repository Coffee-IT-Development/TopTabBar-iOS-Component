//
//  CITTopTabView.swift
//  
//  MIT License
//
//  Copyright (c) 2022 Coffee IT
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI

/// The CITTopTabView is not meant for direct use. Please use the CITTopTabBarView for optimal results.
/// Mulitple instances of CITTopTabView will be displayed based on the amount of tabs passed to the CITTopTabBarView.
/// This class is still made public so it can be previewed using the Canvas if desired.
public struct CITTopTabView: View {
    public let index: Int
    @State public var item: CITTopTab
    public let config: CITTopTabBarView.Configuration
    public let doesAnyTabHaveIcon: Bool
    public let namespace: Namespace.ID
    @Binding public var selectedTab: Int
    @Binding public var greatestTabHeight: CGFloat
    @Binding public var greatestBackgroundHeight: CGFloat
    
    var isSelected: Bool {
        index == selectedTab
    }
    
    var textColor: Color {
        isSelected ? config.selectedTextColor : config.textColor
    }
    
    var iconColors: (selected: Color, unselected: Color) {
        item.iconColors(in: config)
    }
    
    var showUnderline: Bool {
        config.showUnderline
    }
    
    public var body: some View {
        Button {
            selectedTab = index
        } label: {
            ZStack {
                if showUnderline {
                    optionalSelectedBackground
                }
                
                VStack(spacing: 0) {
                    ZStack {
                        if !showUnderline {
                            optionalSelectedBackground
                        }
                        
                        content
                            .padding(config.tabContentInsets)
                            .frame(minHeight: greatestTabHeight)
                            .if(!showUnderline) {
                                $0.background(sizeReader)
                            }
                    }
                    
                    optionalUnderline
                }
                .padding(isSelected ? config.selectedInsets : CITEdgeInsets.zero)
            }
            .animation(config.tabAnimation, value: $selectedTab.wrappedValue)
            .if(showUnderline) {
                $0.background(sizeReader)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .frame(minWidth: config.tabViewMinWidth)
        .accessibilityLabel(item.title)
    }
    
    var content: some View {
        VStack(spacing: config.spacingBelowIcon) {
            if config.iconPosition == .top {
                optionalIcon
            }
            
            HStack(spacing: config.titleToBadgeSpacing) {
                if config.iconPosition == .leading {
                    optionalIcon
                }
                
                if let badge = item.badge, badge.style.position == .leading {
                    CITNotificationBadgeView(badge: badge)
                }
                
                Text(item.title)
                    .font(config.font)
                    .lineLimit(config.lineLimit)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .colorMultiply(textColor)
                
                if let badge = item.badge, badge.style.position == .trailing {
                    CITNotificationBadgeView(badge: badge)
                }
            }
        }
        .onAppear {
            if isSelected && item.removeBadgeOnTabSelected {
                item.badge = nil
            }
        }
        .onChange(of: isSelected) { isSelected in
            if isSelected && item.removeBadgeOnTabSelected {
                withAnimation(config.tabAnimation) {
                    item.badge = nil
                }
            }
        }
    }
    
    // MARK: - Icon
    
    @ViewBuilder
    var optionalIcon: some View {
        if let icon = item.icon {
            icon.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: config.iconSize.width, height: config.iconSize.height)
                .foregroundColor(isSelected ? iconColors.selected : iconColors.unselected)
        } else if doesAnyTabHaveIcon {
            Color.clear
                .frame(width: config.iconSize.width, height: config.iconSize.height)
        }
    }
    
    
    // MARK: - Underline
    
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
    
    // MARK: - Background & Height Logic
    
    /// The following logic handles how the selected background is shown and determines the greatestTabHeight to keep it equal among views.
    /// - if showUnderline: Encapsulate content and underline.
    /// - if not showUnderline: Encapsulate only the content.
    ///
    /// The reason we use optional view with manual height calculation instead of simply using .background(color)
    /// is that "matchedGeometryEffect" does not work in a .background modifier at this point in time. iOS 14-16.
    /// Color fills its given size by default, and if unrestrained, will make the TopTabView much larger than it should be.
    ///
    /// To get the correct height, we use GeometryReader on invisible views.
    /// If selected and has an underline, the proxy height will be the correct size.
    /// For the unselected items, we add the vertical inset to keep the height equal for all tabs.
    /// The result is a smooth transition of the selectedBackground when switching tabs.
    ///
    
    @ViewBuilder
    var optionalSelectedBackground: some View {
        if isSelected {
            config.selectedBackgroundColor
                .frame(height: greatestBackgroundHeight)
                .cornerRadius(config.selectedBackgroundCornerRadius)
                .padding(config.selectedBackgroundInsets)
                .matchedGeometryEffect(id: "background", in: namespace)
        }
    }
    
    var sizeReader: some View {
        GeometryReader { proxy in
            Color.clear
                .onAppear {
                    let height = isSelected && config.showUnderline ? proxy.size.height : proxy.size.height + config.verticalSelectedInset
                    if height > greatestBackgroundHeight {
                        greatestBackgroundHeight = height
                    }
                    
                    if height > greatestTabHeight {
                        greatestTabHeight = height
                    }
                }
        }
    }
}

public struct CITTopTabView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    public static var previews: some View {
        CITTopTabView(index: 0, item: .init(title: "Tab One"), config: .examplePillShaped, doesAnyTabHaveIcon: false, namespace: namespace, selectedTab: .constant(0), greatestTabHeight: .constant(100), greatestBackgroundHeight: .constant(80))
    }
}

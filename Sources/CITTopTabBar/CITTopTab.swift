//
//  CITTopTab.swift
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

/// The CITTopTab is an object that holds info about the contents of the tab, such as the title and the visual logic of the notification badge to be displayed if any.
public struct CITTopTab: Identifiable, Hashable {
    public var id = UUID()
    public var title: String
    public var icon: Image?
    public var iconColorOverride: Color?
    public var selectedIconColorOverride: Color?
    public var badge: CITNotificationBadge?
    public var removeBadgeOnTabSelected: Bool
    
    public init(
        title: String,
        icon: Image? = nil,
        iconColorOverride: Color? = nil,
        selectedIconColorOverride: Color? = nil,
        badge: CITNotificationBadge? = nil,
        removeBadgeOnTabSelected: Bool = false
    ) {
        self.title = title
        self.icon = icon
        self.iconColorOverride = iconColorOverride
        self.selectedIconColorOverride = selectedIconColorOverride
        self.badge = badge
        self.removeBadgeOnTabSelected = removeBadgeOnTabSelected
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
    
    public func iconColors(in config: CITTopTabBarView.Configuration) -> (selected: Color, unselected: Color) {
        (
            selected: selectedIconColorOverride ?? config.selectedIconColor,
            unselected: iconColorOverride ?? config.iconColor
        )
    }
}

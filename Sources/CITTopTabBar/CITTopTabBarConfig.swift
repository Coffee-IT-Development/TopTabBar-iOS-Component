//
//  CITTopTabBarConfig.swift
//  
//
//  Created by Lex Brouwers on 30/06/2022.
//

import SwiftUI

/// The CITTopTabBarConfig provides most of the static attributes of the CITTopTabBarView as a single object, incl.  fonts, colors, tabs and underline options.
/// It can also be used dynamically with @State if desired, e.g. to animate cellSize, cornerRadius or colors.
public struct CITTopTabBarConfig {
    
    /// The backgroundColor of the entire tab bar if not overlayed by anything else,
    public var backgroundColor: Color
    
    /// The backgroundColor of the currently selected tab, if not given, defaults to clear color.
    /// Does not always display correctly in preview, but works as intended at runtime on a phsycial device.
    public var selectedBackgroundColor: Color
    
    /// The text color of tabs that are currently not selected, can be used to apply a simple color for all tab items regardless of selection, like black.
    /// Or if selection is relevant, often used to choose an inactive tab text color like a faded gray.
    public var textColor: Color
    
    /// The text color of the currently selected tab, if not given, defaults to textColor.
    public var selectedTextColor: Color
    
    /// The displayMode is used to select whether the CITTopTabBarView should be shown at the top of the screen or somewhere else.
    /// If .atTopOfScreen is selected, the top safe area will be ignored and filled with the given backgroundColor.
    /// - In this case, topPadding can be used to adjust the inset from the top of the screen.
    public var displayMode: CITTopTabBarDisplayMode
    
    /// The font used to display tab titles.
    public var font: Font
    
    /// Used to add insets to the entire tabbar, commonly used to add horizontal padding to the scrollable content so it doesn't touch the sides in its initial state.
    public var tabBarInsets: EdgeInsets
    
    /// Used to add insets to each tab's content, may be used to increase the size of underlines and simultaneously spacing tabs apart.
    /// If you want to negate the effect this has on the underline's size, adjust the underlineInsets accordingly.
    public var tabContentInsets: EdgeInsets
    
    /// Used to add insets to the underline, may be used to increase spacing between tab content and underline, add bottom padding to the underline, or make it smaller.
    /// If you want to make the underline larger, avoid using negative padding, use tabContentInsets or underlineHeight instead.
    public var underlineInsets: EdgeInsets
    
    /// Used to add insets to the currently selected tab, may be used to achieve effects like raising the selected item, try the value ".init(top: 0, leading: 0, bottom: 10, trailing: 0)".
    /// This effect works the best if all tabs have equal height, weird behaviour may occur if you have active notification badges with irregular height, see CITNotificationBadgeStyle.
    public var selectedInsets: EdgeInsets
    
    /// Used to add insets to the currently selected tab's background if any.
    public var selectedBackgroundInsets: EdgeInsets
    
    /// Used to set visibility of the underline, defaults to true.
    public var showUnderline: Bool
    
    /// The color of the underline, if not given, defaults to selectedTextColor.
    public var underlineColor: Color
    
    /// The height of the underline, defaults to 2px.
    public var underlineHeight: CGFloat
    
    /// The corner radius of the underline, affects how much its corners are rounded, defaults to infinity, i.e. maximum rounding.
    public var underlineCornerRadius: CGFloat
    
    /// The corner radius of the currently selected tab's background, only visible if a selectedBackgroundColor is given.
    /// To achieve a pill shape like selection, try .infinity and setting showUnderline to false.
    /// If you experience a lack of tab content padding with regards to its selected background, check your values for "tabContentInsets" vs "selectedBackgroundInsets" as the latter may negate the former.
    public var selectedBackgroundCornerRadius: CGFloat
    
    /// Used to adjust spacing between a tab's title and its notification badge if any, defaults to 8px.
    public var titleToBadgeSpacing: CGFloat
    
    /// Internal only: used to calculate the correct height for tabs when taking selectedInsets into consideration.
    /// This is what allows for minimal movement when switching between tabs if a selectedBackgroundColor is used without breaking the expected behavior of the matchedGeometryEffect.
    /// Note, this may no longer be necessary in the future if Apple improves the use of matchedGeometryEffect in .background() modifiers.
    public var verticalSelectedInset: CGFloat {
        selectedInsets.bottom + selectedInsets.top
    }
    
    init(
        backgroundColor: Color = Color(UIColor.systemGray5),
        selectedBackgroundColor: Color = .clear,
        textColor: Color = .black.opacity(0.3),
        selectedTextColor: Color = .red,
        displayMode: CITTopTabBarDisplayMode = .atTopOfScreen(topPadding: 50),
        font: Font = .system(size: 13, weight: .light, design: .default),
        tabBarInsets: EdgeInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16),
        tabContentInsets: EdgeInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10),
        underlineInsets: EdgeInsets = CITEdgeInsets.zero,
        selectedInsets: EdgeInsets = CITEdgeInsets.zero,
        selectedBackgroundInsets: EdgeInsets = CITEdgeInsets.zero,
        showUnderline: Bool = true,
        underlineColor: Color? = nil,
        underlineHeight: CGFloat = 2,
        underlineCornerRadius: CGFloat = .infinity,
        selectedBackgroundCornerRadius: CGFloat = 0,
        titleToBadgeSpacing: CGFloat = 8
    ) {
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.textColor = textColor
        self.selectedTextColor = selectedTextColor
        self.displayMode = displayMode
        self.font = font
        self.tabBarInsets = tabBarInsets
        self.tabContentInsets = tabContentInsets
        self.underlineInsets = underlineInsets
        self.selectedInsets = selectedInsets
        self.selectedBackgroundInsets = selectedBackgroundInsets
        self.showUnderline = showUnderline
        self.underlineColor = underlineColor ?? selectedTextColor
        self.underlineHeight = underlineHeight
        self.underlineCornerRadius = underlineCornerRadius
        self.selectedBackgroundCornerRadius = selectedBackgroundCornerRadius
        self.titleToBadgeSpacing = titleToBadgeSpacing
    }
}

extension CITTopTabBarConfig {
    public var ignoreSafeEdgeTopPadding: CGFloat {
        switch displayMode {
        case let .atTopOfScreen(padding):
            return padding
        default:
            return 0
        }
    }
    
    public var showAtTopOfScreen: Bool {
        switch displayMode {
        case .atTopOfScreen(_):
            return true
        default:
            return false
        }
    }
}

public enum CITTopTabBarDisplayMode: Equatable {
    case normal
    case atTopOfScreen(topPadding: CGFloat = 50)
}

extension CITTopTabBarConfig {
    public static var exampleUnderlined = CITTopTabBarConfig()
    public static var exampleAnimatedSelectionInset = CITTopTabBarConfig(selectedInsets: .init(top: 0, leading: 0, bottom: 10, trailing: 0))
    
    /// Warning: the selectedBackgroundColor does not seem to display correctly in the Xcode Canvas preview, but it does work as intended at runtime on a physical device.
    public static var examplePillShaped = CITTopTabBarConfig(backgroundColor: .clear, selectedBackgroundColor: .red.opacity(0.2), showUnderline: false, selectedBackgroundCornerRadius: .infinity)
}

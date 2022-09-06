//
//  CITTopTabBarView+Configuration.swift
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

extension CITTopTabBarView {
    
    /// The CITTopTabBarView+Configuration provides most of the static attributes of the CITTopTabBarView as a single object, incl.  fonts, colors, tabs and underline options.
    public struct Configuration: Equatable {
        
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
        
        /// The size of any icons shown in the tabbar if not overridden.
        public var iconSize: CGSize
        
        /// The color of icons in unselected tabs if not overridden.
        public var iconColor: Color
        
        /// The position of icons in tabs, defaults to `top`.
        public var iconPosition: CITTopTabIconPosition
        
        /// The color of icons in the selected tab if not overridden.
        public var selectedIconColor: Color
        
        /// The spacing below the icon if any icons are shown, e.g. between the icon and the text.
        public var spacingBelowIcon: CGFloat
        
        /// The displayMode is used to select whether the CITTopTabBarView should be shown at the top of the screen or somewhere else.
        /// If .atTopOfScreen is selected, the top safe area will be ignored and filled with the given backgroundColor.
        /// - In this case, topPadding can be used to adjust the inset from the top of the screen.
        public var displayMode: CITTopTabBarDisplayMode
        
        /// The widthMode is used  to select whether the CITTopTabBarView should be scrollable or fill up the given space and give tabs an equal, fixed width.
        public var widthMode: CITTopTabBarWidthMode
        
        /// The font used to display tab titles.
        public var font: Font
        
        /// The line limit for titles in every tab. If `nil`, no line limit applies. Defaults to `1`.
        public var lineLimit: Int?
        
        /// Used to add insets to the entire tabbar, commonly used to add horizontal padding to the scrollable content so it doesn't touch the sides in its initial state.
        public var tabBarInsets: EdgeInsets
        
        /// Used to add insets to each tab's content, may be used to increase the size of underlines and simultaneously spacing tabs apart.
        /// If you want to negate the effect this has on the underline's size, adjust the underlineInsets accordingly.
        public var tabContentInsets: EdgeInsets
        
        /// Minimum width of a single tab. If `nil`, no minimum width applies. Defaults to `90`.
        public var tabViewMinWidth: CGFloat?
        
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
        
        /// The animation applied to the top tab view, applies to all of its content, but most noticably affects the underline and background matchedGeometry animations.
        public var tabAnimation: Animation?
        
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
        
        /// Returns optional top padding to make room for the status bar based on the displayMode.
        public var ignoreSafeEdgeTopPadding: CGFloat {
            switch displayMode {
            case let .atTopOfScreen(padding):
                return padding
            default:
                return 0
            }
        }
        
        /// Returns displayMode as a boolean value to handle wether tab bar should be shown at the top of the view or not.
        public var showAtTopOfScreen: Bool {
            switch displayMode {
            case .atTopOfScreen:
                return true
            default:
                return false
            }
        }
        
        public init(
            backgroundColor: Color                      = .black,
            selectedBackgroundColor: Color              = .clear,
            textColor: Color                            = .white.opacity(0.5),
            selectedTextColor: Color                    = .white,
            iconSize: CGSize                            = .init(width: 24, height: 24),
            iconColor: Color?                           = nil,
            iconPosition: CITTopTabIconPosition         = .top,
            selectedIconColor: Color?                   = nil,
            spacingBelowIcon: CGFloat                   = 6,
            displayMode: CITTopTabBarDisplayMode        = .atTopOfScreen(topPadding: 50),
            widthMode: CITTopTabBarWidthMode            = .scrollable,
            font: Font                                  = .system(size: 14, weight: .regular, design: .default),
            lineLimit: Int?                             = 1,
            tabBarInsets: EdgeInsets                    = CITEdgeInsets.zero,
            tabContentInsets: EdgeInsets                = .init(top: 12, leading: 16, bottom: 12, trailing: 16),
            tabViewMinWidth: CGFloat?                   = 90,
            underlineInsets: EdgeInsets                 = CITEdgeInsets.zero,
            selectedInsets: EdgeInsets                  = CITEdgeInsets.zero,
            selectedBackgroundInsets: EdgeInsets        = CITEdgeInsets.zero,
            showUnderline: Bool                         = true,
            underlineColor: Color?                      = nil,
            underlineHeight: CGFloat                    = 2,
            underlineCornerRadius: CGFloat              = .infinity,
            tabAnimation: Animation?                    = .spring(),
            textAnimation: Animation?                   = .easeInOut(duration: 0.3),
            selectedBackgroundCornerRadius: CGFloat     = 0,
            titleToBadgeSpacing: CGFloat                = 8
        ) {
            self.backgroundColor = backgroundColor
            self.selectedBackgroundColor = selectedBackgroundColor
            self.textColor = textColor
            self.selectedTextColor = selectedTextColor
            self.iconSize = iconSize
            self.iconColor = iconColor ?? textColor
            self.iconPosition = iconPosition
            self.selectedIconColor = selectedIconColor ?? selectedTextColor
            self.spacingBelowIcon = spacingBelowIcon
            self.displayMode = displayMode
            self.widthMode = widthMode
            self.font = font
            self.lineLimit = lineLimit
            self.tabBarInsets = tabBarInsets
            self.tabContentInsets = tabContentInsets
            self.tabViewMinWidth = tabViewMinWidth
            self.underlineInsets = underlineInsets
            self.selectedInsets = selectedInsets
            self.selectedBackgroundInsets = selectedBackgroundInsets
            self.showUnderline = showUnderline
            self.underlineColor = underlineColor ?? selectedTextColor
            self.underlineHeight = underlineHeight
            self.underlineCornerRadius = underlineCornerRadius
            self.tabAnimation = tabAnimation
            self.selectedBackgroundCornerRadius = selectedBackgroundCornerRadius
            self.titleToBadgeSpacing = titleToBadgeSpacing
        }
        
        public static var exampleUnderlined = CITTopTabBarView.Configuration()
        public static var exampleUnderlinedWithSelectedInset = CITTopTabBarView.Configuration(
            tabBarInsets: .init(top: 0, leading: 16, bottom: 0, trailing: 16),
            selectedInsets: .init(top: 0, leading: 0, bottom: 10, trailing: 0)
        )
        
        public static var exampleSlowAnimation = CITTopTabBarView.Configuration(
            tabBarInsets: .init(top: 0, leading: 16, bottom: 0, trailing: 16),
            selectedInsets: .init(top: 0, leading: 0, bottom: 10, trailing: 0),
            tabAnimation: .easeOut(duration: 2),
            textAnimation: .easeOut(duration: 2)
        )
        
        /// Warning: the selectedBackgroundColor does not seem to display correctly in the Xcode Canvas preview, but it does work as intended at runtime on a physical device.
        public static var examplePillShaped = Configuration(
            backgroundColor: .clear,
            selectedBackgroundColor: .white.opacity(0.2),
            tabBarInsets: .init(top: 0, leading: 16, bottom: 0, trailing: 16),
            showUnderline: false,
            selectedBackgroundCornerRadius: .infinity
        )
        
        public static var examplePillShapedWithSelectedInset = Configuration(
            backgroundColor: .clear,
            selectedBackgroundColor: .white.opacity(0.2),
            tabBarInsets: .init(top: 0, leading: 16, bottom: 0, trailing: 16),
            selectedInsets: .init(top: 0, leading: 0, bottom: 16, trailing: 0),
            showUnderline: false,
            selectedBackgroundCornerRadius: .infinity
        )
        
        /// Warning: When trying out the tabs fixedWidth, don't pass along too many tabs.
        /// The default tabViewMinWidth is 90px, which matches material.io design principles.
        /// Here, it's overridden with 10px to prevent confusion when using this config in the example app, which realistically contains too many tab items for this mode.
        ///
        /// Shorter titles have been used as the default linelimit is 1.
        /// For optimal results, try the following tabs setup:
        ///  
        /// ```
        /// @State var tabs: [CITTopTab] = [
        ///     .init(
        ///         title: "Flights",
        ///         icon: .init(systemName: "airplane.departure")
        ///     ),
        ///     .init(
        ///         title: "Shield",
        ///         icon: .init(systemName: "shield")
        ///     ),
        ///     .init(
        ///         title: "Keyfinder",
        ///         icon: .init(systemName: "key.viewfinder"),
        ///         iconColorOverride: .orange.opacity(0.5),
        ///         selectedIconColorOverride: .orange
        ///     ),
        ///     .init(
        ///         title: "Owner",
        ///         icon: .init(systemName: "person.badge.key")
        ///     )
        /// ]
        /// ```
        ///
        public static var exampleTabsWithFixedWidth = Configuration(
            widthMode: .fixed,
            tabViewMinWidth: 10
        )
    }
}

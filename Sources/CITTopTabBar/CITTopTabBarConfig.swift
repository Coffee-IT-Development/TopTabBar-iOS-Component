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
    public var backgroundColor = Color(UIColor.systemGray5)
    
    public var selectedBackgroundColor = Color.red.opacity(0.2)
    
    public var textColor = Color.black.opacity(0.3)
    
    public var selectedTextColor = Color.red
    
    public var displayMode: CITTopTabBarDisplayMode = .atTopOfScreen(topPadding: 50)
    
    public var font: Font = .system(size: 13, weight: .light, design: .default)
    
    public var underlineInsets: EdgeInsets = .zero
    
    public var selectedInsets: EdgeInsets = .init(top: 0, leading: 5, bottom: 10, trailing: 5)
    
    public var showUnderline = true
    
    public var verticalSelectedInset: CGFloat {
        selectedInsets.bottom + selectedInsets.top
    }
    
    // For free on tour:
    //
    // Background options:
    // - background padding
    // - background cornerRadius
    //
    // - Overall cornerRadius
    //
    // underline opacity / Show underline boolean.
    
//Optional backgroundcolor
//
//Borderless style implementation
//
    
    
//Selection underline:
//
// V has selectedColor
//
// V centered below highlighted option
//
// V has full or partial width of tab
//
// V stays loyal to position selectedTab, but no further right than center of screen
//
// V will stay at the position of selectedTab even when scrolling, until a different tab is selected
//
// V animates between previously selected tab and current selected tab on tap
//
    
    
// V Content view should also be swipe-able (optional)
//
// viewmodifier (not needed, handled by tab view, show in example)
//
    
    
//Accessability label per tab
//
//Tab object with label per tab
//
    
    
//Notification badge (optional)
//
// With number (optional)
//
// Trailing and leading option.
//
//color
    
    
    
}

extension CITTopTabBarConfig {
    public var topPadding: CGFloat {
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
    public static var example = CITTopTabBarConfig()
}

extension EdgeInsets {
    static var zero: EdgeInsets {
        .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}

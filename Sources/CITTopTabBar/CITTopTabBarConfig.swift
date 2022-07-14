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
    public var backgroundColor: Color = .clear//Color(UIColor.systemGray5)
    
    public var selectedBackgroundColor: Color = .clear//.red.opacity(0.2) // Defaults to backgroundColor
    
    public var textColor = Color.black.opacity(0.3)
    
    public var selectedTextColor = Color.red
    
    public var displayMode: CITTopTabBarDisplayMode = .atTopOfScreen(topPadding: 50)
    
    public var font: Font = .system(size: 13, weight: .light, design: .default)
    
    public var tabBarInsets: EdgeInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
    
    public var contentInsets: EdgeInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
    
    public var underlineInsets: EdgeInsets = .zero//.init(top: 0, leading: 10, bottom: 10, trailing: 10)
    
    public var selectedInsets: EdgeInsets = .zero//.init(top: 0, leading: 0, bottom: 10, trailing: 0)
    
    public var backgroundInsets: EdgeInsets = .zero//.init(top: 10, leading: 10, bottom: 10, trailing: 10)
    
    public var showUnderline = true
    
    public var underlineColor = Color.red // Defaults to selectedTextColor
    
    public var underlineHeight: CGFloat = 2
    
    public var underlineCornerRadius: CGFloat = .infinity
    
    public var backgroundCornerRadius: CGFloat = 0//.infinity
    
    public var titleToBadgeSpacing: CGFloat = 8
    
    public var verticalSelectedInset: CGFloat {
        selectedInsets.bottom + selectedInsets.top
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
    public static var example = CITTopTabBarConfig()
}

extension EdgeInsets {
    static var zero: EdgeInsets {
        .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}

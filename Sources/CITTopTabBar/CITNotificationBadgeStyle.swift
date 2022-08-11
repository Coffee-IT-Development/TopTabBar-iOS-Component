//
//  CITNotificationBadgeStyle.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//  Copyright © 2022 Coffee IT. All rights reserved.
//

import SwiftUI

public struct CITNotificationBadgeStyle: Equatable {
    public static var defaultSize = CGSize(width: 12, height: 12)
    public static var defaultPosition = CITNotificationBadgePosition.trailing
    public static var defaultTextColor = Color.white
    public static var example = CITNotificationBadgeStyle(color: .red)
    public static var none = CITNotificationBadgeStyle(color: .clear, size: .zero)
    
    public let color: Color
    public let size: CGSize
    public let position: CITNotificationBadgePosition
    public let contentInsets: EdgeInsets
    public let amount: CGFloat?
    public let roundToInt: Bool
    public let font: Font
    public let textColor: Color
    
    public init(
        color: Color,
        size: CGSize = Self.defaultSize,
        position: CITNotificationBadgePosition = Self.defaultPosition,
        contentInsets: EdgeInsets = CITEdgeInsets.zero,
        amount: CGFloat? = nil,
        roundToInt: Bool = true,
        font: Font? = nil,
        textColor: Color = Self.defaultTextColor
    ) {
        self.color = color
        self.size = size
        self.position = position
        self.contentInsets = contentInsets
        self.amount = amount
        self.roundToInt = roundToInt
        self.font = font ?? .system(size: size.height - 2)
        self.textColor = textColor
    }
}

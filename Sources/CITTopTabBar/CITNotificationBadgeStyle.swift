//
//  CITNotificationBadgeStyle.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//

import SwiftUI

public struct CITNotificationBadgeStyle: Equatable {
    public let color: Color
    public let size: CGSize
    public let position: CITNotificationBadgePosition
    public let amount: CGFloat?
    public let roundToInt: Bool
    public let font: Font
    public let textColor: Color
    
    public init(
        color: Color,
        size: CGSize = CITNotificationBadgeStyle.defaultSize,
        position: CITNotificationBadgePosition = CITNotificationBadgeStyle.defaultPosition,
        amount: CGFloat? = nil,
        roundToInt: Bool = true,
        font: Font? = nil,
        textColor: Color = .white
    ) {
        self.color = color
        self.size = size
        self.position = position
        self.amount = amount
        self.roundToInt = roundToInt
        self.font = font ?? .system(size: size.height - 2)
        self.textColor = textColor
    }
    
    public static var defaultSize = CGSize(width: 12, height: 12)
    public static var defaultPosition = CITNotificationBadgePosition.trailing
    public static var none = CITNotificationBadgeStyle(color: .clear, size: .zero)
}

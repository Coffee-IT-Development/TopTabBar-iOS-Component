//
//  CITNotificationBadgeStyle.swift
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

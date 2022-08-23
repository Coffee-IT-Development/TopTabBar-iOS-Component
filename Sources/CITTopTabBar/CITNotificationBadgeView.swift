//
//  CITNotificationBadgeView.swift
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

public struct CITNotificationBadgeView: View {
    public let badge: CITNotificationBadge
    
    public var body: some View {
        Text(badge.amountText)
            .font(badge.style.font)
            .foregroundColor(badge.style.textColor)
            .padding(.horizontal, badge.hasAmount ? 4 : 0)
            .frame(minWidth: badge.style.size.width, minHeight: badge.style.size.height)
            .frame(width: badge.hasAmount ? nil : badge.style.size.width, height: badge.hasAmount ? nil : badge.style.size.height)
            .padding(badge.style.contentInsets)
            .background(badge.style.color)
            .cornerRadius(.infinity)
    }
}

public struct CITNotificationBadgeView_Previews: PreviewProvider {
    public static var previews: some View {
        HStack {
            CITNotificationBadgeView(badge: .circle(style: .example))
            CITNotificationBadgeView(badge: .circle(style: .init(color: .blue)))
            CITNotificationBadgeView(badge: .circle(style: .init(color: .gray, contentInsets: .init(top: 3, leading: 3, bottom: 3, trailing: 3), amount: 12)))
        }
    }
}

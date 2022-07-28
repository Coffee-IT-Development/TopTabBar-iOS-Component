//
//  CITNotificationBadgeView.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//  Copyright © 2022 Coffee IT. All rights reserved.
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

//
//  CITNotificationBadgeView.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//

import SwiftUI

struct CITNotificationBadgeView: View {
    let badge: CITNotificationBadge
    
    var body: some View {
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

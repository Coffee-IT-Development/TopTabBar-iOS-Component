//
//  CITTopTabBadgeView.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//

import SwiftUI

struct CITTopTabBadgeView: View {
    let badge: CITNotificationBadge
    
    var body: some View {
        Text(badge.amountText)
            .font(badge.style.font)
            .foregroundColor(badge.style.textColor)
            .padding(.horizontal, badge.hasAmount ? 4 : 0)
            .frame(
                width: badge.hasAmount ? nil : badge.style.size.width,
                height: badge.style.size.height
            )
            .background(badge.style.color)
            .cornerRadius(.infinity)
    }
}

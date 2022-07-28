//
//  CITNotificationBadge.swift
//  
//
//  Created by Lex Brouwers on 14/07/2022.
//  Copyright © 2022 Coffee IT. All rights reserved.
//

public enum CITNotificationBadge: Equatable {
    case none
    case circle(style: CITNotificationBadgeStyle)
    
    var hasAmount: Bool {
        style.amount != nil
    }
    
    var amountText: String {
        guard let amount = style.amount else {
            return ""
        }
        
        guard !style.roundToInt else {
            return "\(Int(amount.rounded()))"
        }
        
        return "\(amount)"
    }
    
    var style: CITNotificationBadgeStyle {
        switch self {
        case let .circle(style):
            return style
        default:
            return .none
        }
    }
}

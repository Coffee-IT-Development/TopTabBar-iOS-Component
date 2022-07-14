//
//  File.swift
//  
//
//  Created by Lex Brouwers on 05/07/2022.
//

import SwiftUI

public struct CITTopTab: Identifiable, Hashable {
    public var id = UUID()
    public var title: String
    public var badge: CITNotificationBadge?
    
    public init(title: String, badge: CITNotificationBadge? = nil) {
        self.title = title
        self.badge = badge
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
}

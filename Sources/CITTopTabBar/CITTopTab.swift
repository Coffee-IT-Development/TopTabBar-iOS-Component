//
//  File.swift
//  
//
//  Created by Lex Brouwers on 05/07/2022.
//

import SwiftUI

/// The CITTopTab is an object that holds info about the contents of the tab, such as the title and the visual logic of the notification badge to be displayed if any.
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

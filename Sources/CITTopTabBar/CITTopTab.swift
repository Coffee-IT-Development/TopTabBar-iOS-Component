//
//  File.swift
//  
//
//  Created by Lex Brouwers on 05/07/2022.
//

import SwiftUI

public struct CITTopTab {
    public var icon: Image?
    public var title: String
    
    public init(icon: Image? = nil, title: String) {
        self.icon = icon
        self.title = title
    }
}

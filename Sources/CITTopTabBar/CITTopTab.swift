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
    
    public init(title: String) {
        self.title = title
    }
}

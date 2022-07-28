//
//  CITOptionalIgnoreEdges.swift
//  
//
//  Created by Lex Brouwers on 11/07/2022.
//  Copyright © 2022 Coffee IT. All rights reserved.
//

import SwiftUI

public struct CITOptionalIgnoreEdges: ViewModifier {
    var edges: Edge.Set
    var active: Bool

    public func body(content: Content) -> some View {
        if active {
            content.edgesIgnoringSafeArea(edges)
        } else {
            content
        }
    }
}

extension View {
    public func optionalIgnoreEdges(edges: Edge.Set, active: Bool) -> some View {
        modifier(CITOptionalIgnoreEdges(edges: edges, active: active))
    }
}

//
//  CITOptionalIgnoreEdges.swift
//  
//
//  Created by Lex Brouwers on 11/07/2022.
//

import SwiftUI

struct CITOptionalIgnoreEdges: ViewModifier {
    var edges: Edge.Set
    var active: Bool

    func body(content: Content) -> some View {
        if active {
            content.edgesIgnoringSafeArea(edges)
        } else {
            content
        }
    }
}

extension View {
    func optionalIgnoreEdges(edges: Edge.Set, active: Bool) -> some View {
        modifier(CITOptionalIgnoreEdges(edges: edges, active: active))
    }
}

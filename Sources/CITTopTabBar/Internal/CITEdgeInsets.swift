//
//  CITEdgeInsets.swift
//  
//
//  Created by Lex Brouwers on 27/07/2022.
//

import SwiftUI

/// Avoided using an extension of EdgeInsets to prevent possible conflicts with other packages.
public struct CITEdgeInsets {
    public static var zero: EdgeInsets {
        .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}

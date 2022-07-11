//
//  File.swift
//  
//
//  Created by Lex Brouwers on 11/07/2022.
//

import SwiftUI

extension CITTopTabBarView {
    @ViewBuilder
    func optionalIndicator(at index: Int) -> some View {
        if selectedTab == index {
            Color.red
                .frame(height: 2)
                .cornerRadius(.infinity)
                .matchedGeometryEffect(id: "indicator", in: namespace, properties: .frame)
        } else {
            Color.clear
                .frame(height: 2)
        }
    }
}

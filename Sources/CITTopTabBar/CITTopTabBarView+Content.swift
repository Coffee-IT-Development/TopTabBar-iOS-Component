//
//  File.swift
//  
//
//  Created by Lex Brouwers on 11/07/2022.
//

import SwiftUI

extension CITTopTabBarView {
    func tabContent(for item: CITTopTab) -> some View {
        Text(item.title)
            .font(.system(size: 13, weight: .light, design: .default))
            .padding(.top, 20)
            .padding(.horizontal, 20)
    }
}

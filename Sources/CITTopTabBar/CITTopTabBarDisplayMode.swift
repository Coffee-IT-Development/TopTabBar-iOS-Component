//
//  CITTopTabBarDisplayMode.swift
//  
//
//  Created by Lex Brouwers on 23/08/2022.
//  Copyright © 2022 Coffee IT. All rights reserved.
//

import SwiftUI

public enum CITTopTabBarDisplayMode: Equatable {
    case normal
    case atTopOfScreen(topPadding: CGFloat = 50)
}


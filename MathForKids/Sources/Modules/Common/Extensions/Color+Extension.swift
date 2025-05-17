//
//  Color+Extension.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.
//  Copyright © 2025 Gregory Stark. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(appColor: AppColor) {
        if let uiColor = UIColor(named: appColor.rawValue) {
            self.init(uiColor)
        } else {
            self.init(.gray)
        }
    }
}

enum AppColor: String {
    case basic = "Basic"
    case basicRed = "BasicRed"
    case darkText = "DarkText"
    case dataText = "DataText"
    case disableBasic = "DisabledBasic"
    case redBackGround = "RedBackground"
    case backGround = "Background"
}

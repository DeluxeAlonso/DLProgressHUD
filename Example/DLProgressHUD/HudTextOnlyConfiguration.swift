//
//  HudTextOnlyConfiguration.swift
//  DLProgressHUD_Example
//
//  Created by Alonso on 15/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import DLProgressHUD

struct HudTextOnlyConfiguration: HudConfigurationProtocol {

    var hudContentPreferredHeight: CGFloat = 64
    var hudContentPreferredWidth: CGFloat = 180
    var textFont: UIFont = .systemFont(ofSize: 18.0)
    var allowsDynamicWidth: Bool = false

}

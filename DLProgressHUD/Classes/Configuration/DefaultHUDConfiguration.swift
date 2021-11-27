//
//  DefaultHudConfiguration.swift.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import UIKit

public class DefaultHudConfiguration: HudConfigurationProtocol {

    static let shared = DefaultHudConfiguration()

    init() {}

    var backgroundColor: UIColor = .clear

    var hudColor: UIColor = UIColor(white: 0.8, alpha: 0.36)

    var activityIndicatorColor: UIColor = UIColor.darkGray

    var activityIndicatorStyle: UIActivityIndicatorView.Style = .whiteLarge

    var textColor: UIColor = UIColor.black

    var textFont: UIFont = UIFont.boldSystemFont(ofSize: 24)

    var hudContentPreferredWidth: CGFloat = 120.0

    var hudContentPreferredHeight: CGFloat = 120.0

    var hudContentCornerRadius: CGFloat = 10.0

    var presentationAnimationDuration: CGFloat = 0.5

}

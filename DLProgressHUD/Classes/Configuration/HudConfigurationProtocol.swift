//
//  HudConfigurationProtocol.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import UIKit

public protocol HudConfigurationProtocol {

    var backgroundColor: UIColor { get }
    var hudColor: UIColor { get }
    var activityIndicatorColor: UIColor { get }
    var activityIndicatorStyle: UIActivityIndicatorView.Style { get }

    var textColor: UIColor { get }
    var textFont: UIFont { get }

    var hudContentPreferredWidth: CGFloat { get }
    var hudContentPreferredHeight: CGFloat { get }

    var hudContentCornerRadius: CGFloat { get }

    var presentationAnimationDuration: CGFloat { get }

}

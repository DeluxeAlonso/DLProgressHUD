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

    var hudContentVisualEffectBlurStyle: UIBlurEffect.Style { get }

    var presentationAnimationDuration: CGFloat { get }
    var presentationAnimationDelay: CGFloat { get }

    var backgroundInteractionEnabled: Bool { get }

    var descriptionTextFont: UIFont { get }
    var descriptionTextColor: UIColor { get }
    var descriptionTextNumberOfLines: Int { get }

}

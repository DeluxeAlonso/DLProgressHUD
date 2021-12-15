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

public extension HudConfigurationProtocol {

    var backgroundColor: UIColor { .clear }

    var hudColor: UIColor { UIColor(white: 0.8, alpha: 0.36) }

    var activityIndicatorColor: UIColor { UIColor.darkGray }

    var activityIndicatorStyle: UIActivityIndicatorView.Style { .whiteLarge }

    var textColor: UIColor { UIColor.black }

    var textFont: UIFont { UIFont.boldSystemFont(ofSize: 24) }

    var hudContentPreferredWidth: CGFloat { 120.0 }

    var hudContentPreferredHeight: CGFloat { 120.0 }

    var hudContentCornerRadius: CGFloat { 10.0 }

    var hudContentVisualEffectBlurStyle: UIBlurEffect.Style { .light }

    var presentationAnimationDuration: CGFloat { 0.3 }

    var presentationAnimationDelay: CGFloat { 0.0 }

    var backgroundInteractionEnabled: Bool { false }

    var descriptionTextFont: UIFont { .systemFont(ofSize: 16) }

    var descriptionTextColor: UIColor { .black }

    var descriptionTextNumberOfLines: Int { 0 }

}

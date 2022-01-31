//
//  HudConfigurationProtocol.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import UIKit

public protocol HudConfigurationProtocol {

    /// Background color of the view behind the HUD.
    var backgroundColor: UIColor { get }
    /// HUD container color.
    var hudColor: UIColor { get }

    /// The color of the activity indicator. If you set a color for an activity indicator, it overrides the color provided by the *activityIndicatorStyle* property.
    var activityIndicatorColor: UIColor { get }
    /// The basic appearance of the activity indicator.
    var activityIndicatorStyle: UIActivityIndicatorView.Style { get }

    var hudContentPreferredWidth: CGFloat { get }
    var hudContentPreferredHeight: CGFloat { get }

    var hudContentCornerRadius: CGFloat { get }

    var hudContentVisualEffectBlurStyle: UIBlurEffect.Style { get }

    var presentationAnimationDuration: CGFloat { get }
    var presentationAnimationDelay: CGFloat { get }

    /// If set to true, user can interact with the whole screen as long as the HUD is being presented.
    var backgroundInteractionEnabled: Bool { get }

    var textFont: UIFont { get }
    var textColor: UIColor { get }
    var textNumberOfLines: Int { get }
    var textAlignment: NSTextAlignment { get }

    var hudImageHeight: CGFloat { get }

    /// If set to true HUD gets automatically dismissed after the  elapsed time defined by *presentationDuration* is over.
    var shouldDismissAutomatically: Bool { get }

    /// Presentation duration of the progress HUD. It will only have an effect if *shouldDismissAutomatically* is set to true.
    var presentationDuration: TimeInterval { get }
    /// Automatic dismiss animation duration of the progress HUD. It will only have an effect if *shouldDismissAutomatically* is set to true.
    var automaticDismissAnimationDuration: CGFloat { get }

    /// Available only for *textOnly* mode.
    var allowsDynamicTextWidth: Bool { get }
    /// Available only for *textOnly* mode. It will only have an effect if *allowsDynamicTextWidth* is set to true.
    var horizontalDynamicTextMargin: CGFloat { get }
    /// Available only for *textOnly* mode. It will only have an effect if *allowsDynamicTextWidth* is set to true.
    var horizontalDynamicTextPadding: CGFloat { get }

}

public extension HudConfigurationProtocol {

    var backgroundColor: UIColor { .clear }

    var hudColor: UIColor { UIColor(white: 0.8, alpha: 0.36) }

    var activityIndicatorColor: UIColor { UIColor.darkGray }

    var activityIndicatorStyle: UIActivityIndicatorView.Style { .whiteLarge }

    var hudContentPreferredWidth: CGFloat { 120.0 }

    var hudContentPreferredHeight: CGFloat { 120.0 }

    var hudContentCornerRadius: CGFloat { 10.0 }

    var hudContentVisualEffectBlurStyle: UIBlurEffect.Style { .light }

    var presentationAnimationDuration: CGFloat { 0.3 }

    var presentationAnimationDelay: CGFloat { 0.0 }

    var backgroundInteractionEnabled: Bool { true }

    var textFont: UIFont { .systemFont(ofSize: 16) }

    var textColor: UIColor { .black }

    var textNumberOfLines: Int { 0 }

    var textAlignment: NSTextAlignment { .center }

    var hudImageHeight: CGFloat { 72 }

    var shouldDismissAutomatically: Bool { false }

    var presentationDuration: TimeInterval { 3.0 }

    var automaticDismissAnimationDuration: CGFloat { 0.5 }

    var allowsDynamicTextWidth: Bool { false }

    var horizontalDynamicTextMargin: CGFloat { 32.0 }

    var horizontalDynamicTextPadding: CGFloat { 24.0 }

}

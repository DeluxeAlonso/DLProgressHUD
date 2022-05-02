//
//  HudConfigurationProtocol.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import UIKit

public protocol HudConfigurationProtocol {

    /// The background color of the view behind the HUD.
    var backgroundColor: UIColor { get }
    /// The HUD content view color.
    var hudContentColor: UIColor { get }

    /// The color of the activity indicator. If you set a color for an activity indicator, it overrides the color provided by the *activityIndicatorStyle* property.
    var activityIndicatorColor: UIColor { get }
    /// The basic appearance of the activity indicator.
    var activityIndicatorStyle: UIActivityIndicatorView.Style { get }

    /// The preferred width of the HUD content view.
    var hudContentPreferredWidth: CGFloat { get }
    /// The preferred height of the HUD conten view.
    var hudContentPreferredHeight: CGFloat { get }

    /// The radius to use when drawing rounded corners for the layer’s background of the HUD content view.
    var hudContentCornerRadius: CGFloat { get }

    /// The intensity of the blur effect in the HUD content view.
    var hudContentVisualEffectBlurStyle: UIBlurEffect.Style { get }

    /// The total duration of the HUD presentation animation, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
    var presentationAnimationDuration: CGFloat { get }
    /// The amount of time (measured in seconds) to wait before beginning the HUD presentation animation. Specify a value of 0 to begin the animations immediately.
    var presentationAnimationDelay: CGFloat { get }

    /// If set to true, user can interact with the whole screen as long as the HUD is being presented.
    var backgroundInteractionEnabled: Bool { get }

    /// The font of the HUD text.
    var textFont: UIFont { get }
    /// The color of the HUD text.
    var textColor: UIColor { get }
    /// The maximum number of lines for rendering the HUD text.
    var textNumberOfLines: Int { get }
    /// The technique for aligning the HUD text.
    var textAlignment: NSTextAlignment { get }

    /// The height of the HUD image.
    var hudImageHeight: CGFloat { get }

    /// If set to true HUD gets automatically dismissed after the  elapsed time defined by *presentationDuration* is over.
    var shouldDismissAutomatically: Bool { get }
    /// Presentation duration of the progress HUD. It will only have an effect if *shouldDismissAutomatically* is set to true.
    var presentationDuration: TimeInterval { get }
    /// Automatic dismiss animation duration of the progress HUD. It will only have an effect if *shouldDismissAutomatically* is set to true.
    var automaticDismissAnimationDuration: CGFloat { get }

    var shouldDismissOnTouch: Bool { get }

    /// Available only for *textOnly* mode.
    var allowsDynamicTextWidth: Bool { get }
    /// Available only for *textOnly* mode. It will only have an effect if *allowsDynamicTextWidth* is set to true.
    var horizontalDynamicTextMargin: CGFloat { get }
    /// Available only for *textOnly* mode. It will only have an effect if *allowsDynamicTextWidth* is set to true.
    var horizontalDynamicTextPadding: CGFloat { get }

    /// Spacing between image view and text label when using *imageWithText* mode.
    var imageAndTextSpacing: CGFloat { get }
    /// Spacing between loading indicator and text label when using *loadingWithText* mode.
    var loadingIndicatorAndTextSpacing: CGFloat { get }

}

public extension HudConfigurationProtocol {

    var backgroundColor: UIColor { .clear }

    var hudContentColor: UIColor { UIColor(white: 0.8, alpha: 0.36) }

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

    var shouldDismissOnTouch: Bool { false }

    var allowsDynamicTextWidth: Bool { false }

    var horizontalDynamicTextMargin: CGFloat { 32.0 }

    var horizontalDynamicTextPadding: CGFloat { 24.0 }

    var imageAndTextSpacing: CGFloat { 4.0 }

    var loadingIndicatorAndTextSpacing: CGFloat  { 12.0 }

}

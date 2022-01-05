//
//  DefaultHudConfiguration.swift.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import UIKit

public class DefaultHudConfiguration: HudConfigurationProtocol {

    public static let shared = DefaultHudConfiguration()

    init() {}

    public var backgroundColor: UIColor = .clear

    public var hudColor: UIColor = UIColor(white: 0.8, alpha: 0.36)

    public var activityIndicatorColor: UIColor = UIColor.darkGray

    public var activityIndicatorStyle: UIActivityIndicatorView.Style = .whiteLarge

    public var hudContentPreferredWidth: CGFloat = 120.0

    public var hudContentPreferredHeight: CGFloat = 120.0

    public var hudContentCornerRadius: CGFloat = 10.0

    public var hudContentVisualEffectBlurStyle: UIBlurEffect.Style = .light

    public var presentationAnimationDuration: CGFloat = 0.3

    public var presentationAnimationDelay: CGFloat = 0.0

    public var backgroundInteractionEnabled: Bool = false

    public var textFont: UIFont = .systemFont(ofSize: 16)

    public var textColor: UIColor = .black

    public var textNumberOfLines: Int = 0

    public var hudImageHeight: CGFloat = 72

}

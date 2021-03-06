//
//  HUDContainerView.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import UIKit

protocol HudContainerViewDelegate: AnyObject {

    func hudContainerView(_ hudContainerView: HudContainerView, didTapHUDContent shouldClose: Bool)

}

final class HudContainerView: UIView {

    private lazy var hudContentView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: configuration.hudContentVisualEffectBlurStyle))
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Dependencies

    private let configuration: HudConfigurationProtocol
    private let hudMode: DLProgressHUD.Mode

    weak var delegate: HudContainerViewDelegate?

    // MARK: - Initializers

    init(configuration: HudConfigurationProtocol, hudMode: DLProgressHUD.Mode) {
        self.configuration = configuration
        self.hudMode = hudMode
        super.init(frame: UIScreen.main.bounds)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Private

    private func setupUI() {
        isUserInteractionEnabled = shouldAllowUserInteraction

        backgroundColor = configuration.backgroundColor

        hudContentView.backgroundColor = configuration.hudContentColor
        hudContentView.layer.cornerRadius = configuration.hudContentCornerRadius

        addSubview(hudContentView)
        NSLayoutConstraint.activate([hudContentView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     hudContentView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     hudContentView.heightAnchor.constraint(equalToConstant: configuration.hudContentPreferredHeight)])
        switch hudMode {
        case .textOnly:
            if configuration.allowsDynamicTextWidth {
                hudContentView.horizontalMarginInSuperview(margin: configuration.horizontalDynamicTextMargin)
            } else {
                fallthrough
            }
        case .loading, .imageWithText, .image, .loadingWithText:
            hudContentView.constraintWidth(constant: configuration.hudContentPreferredWidth)
        }

        let contentView = makeContentView(for: hudMode)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        hudContentView.contentView.addSubview(contentView)
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: hudContentView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: hudContentView.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: hudContentView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: hudContentView.bottomAnchor)])

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleHudContentViewTap))
        hudContentView.addGestureRecognizer(tapGestureRecognizer)
    }

    private func makeContentView(for hudMode: DLProgressHUD.Mode) -> UIView {
        switch hudMode {
        case .loading:
            return HudActivityIndicatorView(configuration: configuration)
        case .loadingWithText(let text):
            return HudActivityIndicatorView(configuration: configuration, descriptionText: text)
        case .image(let image):
            return HudImageView(configuration: configuration, hudImage: image)
        case .imageWithText(let image, let text):
            return HudImageView(configuration: configuration, hudImage: image, descriptionText: text)
        case .textOnly(let text):
            return HudTextOnlyView(configuration: configuration, descriptionText: text)
        }
    }

    @objc private func handleHudContentViewTap() {
        delegate?.hudContainerView(self, didTapHUDContent: configuration.shouldDismissOnTouch)
    }

    // MARK: - Utils

    var shouldAllowUserInteraction: Bool {
        // If shouldDismissOnTouch is true container view should allow user interaction.
        guard !configuration.shouldDismissOnTouch else { return true }
        return !configuration.backgroundInteractionEnabled
    }

}

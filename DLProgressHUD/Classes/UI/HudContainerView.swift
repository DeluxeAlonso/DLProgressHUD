//
//  HUDContainerView.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import UIKit

class HudContainerView: UIView {

    private lazy var hudContentView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: configuration.hudContentVisualEffectBlurStyle))
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let configuration: HudConfigurationProtocol

    init(configuration: HudConfigurationProtocol) {
        self.configuration = configuration
        super.init(frame: UIScreen.main.bounds)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setupUI() {
        isUserInteractionEnabled = configuration.backgroundInteractionEnabled

        backgroundColor = configuration.backgroundColor

        hudContentView.backgroundColor = configuration.hudColor
        hudContentView.layer.cornerRadius = configuration.hudContentCornerRadius

        addSubview(hudContentView)
        NSLayoutConstraint.activate([hudContentView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     hudContentView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     hudContentView.heightAnchor.constraint(equalToConstant: configuration.hudContentPreferredHeight),
                                     hudContentView.widthAnchor.constraint(equalToConstant: configuration.hudContentPreferredWidth)])

        let indicatorView = HudActivityIndicatorView(configuration: configuration)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        hudContentView.contentView.addSubview(indicatorView)
        NSLayoutConstraint.activate([indicatorView.leadingAnchor.constraint(equalTo: hudContentView.leadingAnchor),
                                     indicatorView.trailingAnchor.constraint(equalTo: hudContentView.trailingAnchor),
                                     indicatorView.topAnchor.constraint(equalTo: hudContentView.topAnchor),
                                     indicatorView.bottomAnchor.constraint(equalTo: hudContentView.bottomAnchor)])
    }

}

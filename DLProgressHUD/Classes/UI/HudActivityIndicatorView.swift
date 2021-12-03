//
//  HudActivityIndicatorView.swift
//  DLProgressHUD
//
//  Created by Alonso on 3/12/21.
//

import UIKit

class HudActivityIndicatorView: UIView {

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.startAnimating()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()

    // MARK: - Dependencies

    private let configuration: HudConfigurationProtocol

    // MARK: - Initializers

    init(configuration: HudConfigurationProtocol) {
        self.configuration = configuration
        super.init(frame: UIScreen.main.bounds)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Private

    private func setupUI() {
        activityIndicatorView.color = configuration.activityIndicatorColor
        activityIndicatorView.style = configuration.activityIndicatorStyle

        addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }

}

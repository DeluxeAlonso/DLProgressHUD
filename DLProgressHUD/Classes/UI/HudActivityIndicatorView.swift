//
//  HudActivityIndicatorView.swift
//  DLProgressHUD
//
//  Created by Alonso on 3/12/21.
//

import UIKit

class HudActivityIndicatorView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = configuration.activityIndicatorColor
        activityIndicatorView.style = configuration.activityIndicatorStyle
        activityIndicatorView.startAnimating()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Dependencies

    private let configuration: HudConfigurationProtocol

    private let text: String?

    // MARK: - Initializers

    init(configuration: HudConfigurationProtocol, text: String? = "Loading...") {
        self.configuration = configuration
        self.text = text
        super.init(frame: UIScreen.main.bounds)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Private

    private func setupUI() {
        addSubview(stackView)
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
                                     stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
                                     stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
                                     stackView.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor),
                                     stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     stackView.centerXAnchor.constraint(equalTo: centerXAnchor)])

        let activityIndicatorContainerView = UIView()
        activityIndicatorContainerView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorContainerView.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: activityIndicatorContainerView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: activityIndicatorContainerView.centerYAnchor),
            activityIndicatorView.topAnchor.constraint(greaterThanOrEqualTo: activityIndicatorContainerView.topAnchor),
            activityIndicatorView.bottomAnchor.constraint(lessThanOrEqualTo: activityIndicatorContainerView.bottomAnchor),
            activityIndicatorView.leadingAnchor.constraint(greaterThanOrEqualTo: activityIndicatorContainerView.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(greaterThanOrEqualTo: activityIndicatorContainerView.trailingAnchor),
        ])

        stackView.addArrangedSubview(activityIndicatorContainerView)
        if let text = text {
            let textLabelContainerView = UIView()
            textLabelContainerView.addSubview(textLabel)
            NSLayoutConstraint.activate([
                textLabel.topAnchor.constraint(equalTo: textLabelContainerView.topAnchor, constant: 8),
                textLabel.bottomAnchor.constraint(equalTo: textLabelContainerView.bottomAnchor, constant: -8),
                textLabel.leadingAnchor.constraint(equalTo: textLabelContainerView.leadingAnchor, constant: 8),
                textLabel.trailingAnchor.constraint(equalTo: textLabelContainerView.trailingAnchor, constant: -8)
            ])

            stackView.addArrangedSubview(textLabelContainerView)
            textLabel.text = text
        }
    }

    private func setupActivityIndicatorView() {
        activityIndicatorView.color = configuration.activityIndicatorColor
        activityIndicatorView.style = configuration.activityIndicatorStyle

        addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }

}

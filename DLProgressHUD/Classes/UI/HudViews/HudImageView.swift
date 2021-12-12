//
//  HudImageView.swift
//  DLProgressHUD
//
//  Created by Alonso on 11/12/21.
//

import UIKit

final class HudImageView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = configuration.descriptionTextNumberOfLines
        label.textAlignment = .center
        label.font = configuration.descriptionTextFont
        label.textColor = configuration.descriptionTextColor
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Dependencies

    private let configuration: HudConfigurationProtocol

    private let hudImage: UIImage
    private let descriptionText: String?

    // MARK: - Initializers

    init(configuration: HudConfigurationProtocol, hudImage: UIImage, descriptionText: String? = nil) {
        self.configuration = configuration
        self.hudImage = hudImage
        self.descriptionText = descriptionText
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

        let imageContainterView = UIView()
        imageContainterView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageContainterView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainterView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainterView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainterView.bottomAnchor),
        ])
        imageView.image = hudImage

        stackView.addArrangedSubview(imageContainterView)
        if let descriptionText = descriptionText {
            let textLabelContainerView = UIView()
            textLabelContainerView.addSubview(textLabel)
            NSLayoutConstraint.activate([
                textLabel.topAnchor.constraint(equalTo: textLabelContainerView.topAnchor),
                textLabel.bottomAnchor.constraint(equalTo: textLabelContainerView.bottomAnchor),
                textLabel.leadingAnchor.constraint(equalTo: textLabelContainerView.leadingAnchor, constant: 8),
                textLabel.trailingAnchor.constraint(equalTo: textLabelContainerView.trailingAnchor, constant: -8)
            ])

            stackView.addArrangedSubview(textLabelContainerView)
            textLabel.text = descriptionText
        }
    }

}

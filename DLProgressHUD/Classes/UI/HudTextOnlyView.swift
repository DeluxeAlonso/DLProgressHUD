//
//  HudTextOnlyView.swift
//  DLProgressHUD
//
//  Created by Alonso on 10/12/21.
//

import UIKit

class HudTextOnlyView: UIView {

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
    private let descriptionText: String

    // MARK: - Initializers

    init(configuration: HudConfigurationProtocol, descriptionText: String) {
        self.configuration = configuration
        self.descriptionText = descriptionText
        super.init(frame: UIScreen.main.bounds)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Private

    private func setupUI() {
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        textLabel.text = descriptionText
    }

}

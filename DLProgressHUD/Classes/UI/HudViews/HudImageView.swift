//
//  HudImageView.swift
//  DLProgressHUD
//
//  Created by Alonso on 11/12/21.
//

import UIKit

class HudImageView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Dependencies

    private let configuration: HudConfigurationProtocol
    private let image: UIImage

    // MARK: - Initializers

    init(configuration: HudConfigurationProtocol, image: UIImage) {
        self.configuration = configuration
        self.image = image
        super.init(frame: UIScreen.main.bounds)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Private

    private func setupUI() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        imageView.image = image
    }

}

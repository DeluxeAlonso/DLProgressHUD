//
//  DLProgressHUD.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

import Foundation

public class DLProgressHUD {
    
    private static let shared = DLProgressHUD()
    
    private var hudContainerView: HudContainerView?
    
    init() {}
    
    private func show(with configuration: HudConfigurationProtocol, and mode: Mode, completion: ((Bool) -> Void)?) {
        // If hud is already being shown we dismiss it.
        if hudContainerView != nil { dismissWithoutAnimation() }

        hudContainerView = HudContainerView(configuration: configuration, hudMode: mode)
        hudContainerView?.translatesAutoresizingMaskIntoConstraints = false
        guard let hudContainerView = hudContainerView else { return }
        hudContainerView.alpha = 0.0
        
        guard let mainWindow = UIApplication.shared.windows.first else {
            assertionFailure("Main view should not be nil")
            return
        }
        mainWindow.addSubview(hudContainerView)
        hudContainerView.fillSuperview()
        
        UIView.animate(withDuration: configuration.presentationAnimationDuration,
                       delay: configuration.presentationAnimationDelay,
                       options: [.curveEaseOut], animations: {
            hudContainerView.alpha = 1.0
        }, completion: { completed in
            completion?(completed)
        })
    }

    private func dismiss(with animationDuration: TimeInterval = 0.0) {
        guard hudContainerView != nil else { return }
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: [.curveEaseOut], animations: {
            self.hudContainerView?.alpha = 0.0
        }, completion: { _ in
            self.hudContainerView?.removeFromSuperview()
            self.hudContainerView = nil
        })
    }

    private func dismissWithoutAnimation() {
        hudContainerView?.isHidden = true
        hudContainerView?.removeFromSuperview()
        hudContainerView = nil
    }

}

public extension DLProgressHUD {

    static var defaultConfiguration = DefaultHudConfiguration.shared
    
    class func show(_ mode: Mode = .loading,
                    configuration: HudConfigurationProtocol = DefaultHudConfiguration.shared,
                    completion: ((Bool) -> Void)? = nil) {
        DLProgressHUD.shared.show(with: configuration, and: mode, completion: completion)
    }
    
    class func dismiss(with animationDuration: TimeInterval = 0.0) {
        DLProgressHUD.shared.dismiss(with: animationDuration)
    }
    
}

public extension DLProgressHUD {

    enum Mode {
        case loading
        case loadingWithText(_ text: String)
        case textOnly(_ text: String)
        case image(_ image: UIImage)
        case imageWithText(image: UIImage, text: String)
    }

}

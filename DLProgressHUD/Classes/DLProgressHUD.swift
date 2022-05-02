//
//  DLProgressHUD.swift
//  DLProgressHUD
//
//  Created by Alonso on 27/11/21.
//

public class DLProgressHUD {
    
    private static let shared = DLProgressHUD()
    
    private var hudContainerView: HudContainerView?
    private var presentationTimer: Timer?

    public static let defaultConfiguration = DefaultHudConfiguration.shared

    public init() {}

    private func show(in parentView: UIView, with configuration: HudConfigurationProtocol, and mode: Mode, completion: ((Bool) -> Void)?) {
        // If hud is already being shown we dismiss it.
        if hudContainerView != nil { dismissWithoutAnimation() }

        hudContainerView = HudContainerView(configuration: configuration, hudMode: mode)
        hudContainerView?.delegate = self
        hudContainerView?.translatesAutoresizingMaskIntoConstraints = false
        guard let hudContainerView = hudContainerView else { return }
        hudContainerView.alpha = 0.0

        parentView.addSubview(hudContainerView)
        hudContainerView.fillSuperview()

        UIView.animate(withDuration: configuration.presentationAnimationDuration,
                       delay: configuration.presentationAnimationDelay,
                       options: [.curveEaseOut], animations: {
            hudContainerView.alpha = 1.0
        }, completion: { completed in
            completion?(completed)
        })

        if configuration.shouldDismissAutomatically {
            presentationTimer?.invalidate()
            presentationTimer = Timer.scheduledTimer(withTimeInterval: configuration.presentationDuration, repeats: false) { [weak self] _ in
                self?.dismiss(with: configuration.automaticDismissAnimationDuration)
            }
        }
    }

    public func dismiss(with animationDuration: TimeInterval = 0.0) {
        guard hudContainerView != nil else { return }
        guard animationDuration != 0.0 else {
            dismissWithoutAnimation()
            return
        }
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

    @available(iOSApplicationExtension, unavailable)
    class func show(_ mode: Mode = .loading,
                    configuration: HudConfigurationProtocol = DefaultHudConfiguration.shared,
                    completion: ((Bool) -> Void)? = nil) {
        guard let mainWindow = UIApplication.shared.windows.first else {
            assertionFailure("Main view should not be nil")
            return
        }
        DLProgressHUD.shared.show(in: mainWindow, with: configuration, and: mode, completion: completion)
    }

    class func show(_ mode: Mode = .loading,
                    in view: UIView,
                    configuration: HudConfigurationProtocol = DefaultHudConfiguration.shared,
                    completion: ((Bool) -> Void)? = nil) {
        DLProgressHUD.shared.show(in: view, with: configuration, and: mode, completion: completion)
    }
    
    class func dismiss(with animationDuration: TimeInterval = 0.0) {
        DLProgressHUD.shared.dismiss(with: animationDuration)
    }
    
}

public extension DLProgressHUD {

    enum Mode: Equatable {
        /// HUD with an activity indicator only.
        case loading
        /// HUD with an activity indicator and a text label below it.
        case loadingWithText(_ text: String)
        /// HUD with a text label only.
        case textOnly(_ text: String)
        /// HUD with an image view only.
        case image(_ image: UIImage)
        /// HUD with an image view and a text label below it.
        case imageWithText(image: UIImage, text: String)
    }

}

// MARK: - HudContainerViewDelegate

extension DLProgressHUD: HudContainerViewDelegate {

    func hudContainerView(_ hudContainerView: HudContainerView, didTapHUDContent shouldClose: Bool) {
        if shouldClose { dismiss() }
    }

}

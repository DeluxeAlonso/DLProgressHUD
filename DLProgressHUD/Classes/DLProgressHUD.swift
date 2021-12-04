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
    
    private func show(with configuration: HudConfigurationProtocol = DefaultHudConfiguration.shared,
                      completion: ((Bool) -> Void)? = nil) {
        // If hud is already being shown we dismiss it.
        if hudContainerView != nil { dismiss() }
        
        hudContainerView = HudContainerView(configuration: configuration)
        guard let hudContainerView = hudContainerView else { return }
        hudContainerView.alpha = 0.0
        
        let mainWindow = UIApplication.shared.windows.first ?? UIWindow()
        mainWindow.addSubview(hudContainerView)
        
        UIView.animate(withDuration: configuration.presentationAnimationDuration,
                       delay: configuration.presentationAnimationDelay,
                       options: [.curveEaseOut], animations: {
            hudContainerView.alpha = 1.0
        }, completion: { completed in
            completion?(completed)
        })
    }
    
    private func dismiss(with animationDuration: TimeInterval = 0.0) {
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: [.curveEaseOut], animations: {
            self.hudContainerView?.alpha = 0.0
        }, completion: { _ in
            self.hudContainerView?.removeFromSuperview()
            self.hudContainerView = nil
        })
    }
    
}

public extension DLProgressHUD {
    
    class func show(with configuration: HudConfigurationProtocol = DefaultHudConfiguration.shared,
                    completion: ((Bool) -> Void)? = nil) {
        DLProgressHUD.shared.show(with: configuration, completion: completion)
    }
    
    class func dismiss(with animationDuration: TimeInterval = 0.0) {
        DLProgressHUD.shared.dismiss(with: animationDuration)
    }
    
}

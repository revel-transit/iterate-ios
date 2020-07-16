//
//  PassthroughWindow.swift
//  Iterate
//
//  Created by Michael Singleton on 1/3/20.
//  Copyright © 2020 Pickaxe LLC. (DBA Iterate). All rights reserved.
//

import UIKit


/// PassthroughWindow class is the primary display layer for Iterate, it's a window that sits above the
/// current application window ensuring it an be displayed anywhere at anytime.
final class PassthroughWindow: UIWindow {
    init(survey: Survey, delegate: ContainerWindowDelegate) {
        if #available(iOS 13.0, *) {
            // Attach the window to the first foreground active UIWindowScene
            if let scene = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first {
                super.init(windowScene: scene)
            } else {
                super.init(frame: UIScreen.main.bounds)
            }
        } else {
            super.init(frame: UIScreen.main.bounds)
        }
        
        // Initialize the root view controller
        if let containerViewController = UIStoryboard(
            name: "Surveys",
            bundle: Iterate.shared.bundle
        ).instantiateViewController(withIdentifier: "ContainerViewController") as? ContainerViewController {
            containerViewController.survey = survey
            containerViewController.delegate = delegate
            self.rootViewController = containerViewController
        }
        
        isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init from coder not supported")
    }
    
    /// Override the hit test to ignore hits on the window itself, this way it will pass through events to underlying views
    /// - Parameters:
    ///   - point: Point of hit
    ///   - event: Event that caused the hit
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        return view == self ? nil : view
    }
}
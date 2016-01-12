//
//  TransitionAnimator.swift
//  Simpplr-OSX
//
//  Created by Marcin Jackowski on 14.12.2015.
//  Copyright © 2015 Simpplr. All rights reserved.
//

import Foundation
import Cocoa

class CustomPresentationAnimator: NSObject, NSViewControllerPresentationAnimator {
    
    func animatePresentationOfViewController(viewController: NSViewController, fromViewController: NSViewController) {
        viewController.view.wantsLayer = true
        viewController.view.layerContentsRedrawPolicy = .OnSetNeedsDisplay
        viewController.view.alphaValue = 0
        fromViewController.view.addSubview(viewController.view)
        let frame: CGRect = NSRectToCGRect(fromViewController.view.frame)
        viewController.view.frame = NSRectFromCGRect(frame)
        let color: CGColorRef = NSColor.whiteColor().CGColor
        viewController.view.layer?.backgroundColor = color
        
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            viewController.view.animator().alphaValue = 1
        }, completionHandler: nil)
    }
    
    func animateDismissalOfViewController(viewController: NSViewController, fromViewController: NSViewController) {
        viewController.view.wantsLayer = true
        viewController.view.layerContentsRedrawPolicy = .OnSetNeedsDisplay
        
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            viewController.view.animator().alphaValue = 0
        }, completionHandler: {
            viewController.view.removeFromSuperview()
        })
    }
}
//
//  ViewController.swift
//  OSXNavigation
//
//  Created by Marcin Jackowski on 12/01/16.
//  Copyright © 2016 Marcin Jackowski. All rights reserved.
//

import Foundation
import Cocoa

class ViewController: NSViewController {
    func popViewController(viewController: ViewController, currentViewController: ViewController) {
        viewController.dismissViewController(currentViewController)
    }
    
    func pushViewController(viewController: ViewController) {
        guard let window = NSApplication.sharedApplication().mainWindow?.windowController as? WindowViewController else { return }
        
        window.currentViewController = viewController
        window.segmentedControl.setEnabled(true, forSegment: 0)
        window.segmentedControl.setEnabled(false, forSegment: 1)
        let animator = CustomPresentationAnimator()
        presentViewController(viewController, animator: animator)
    }
}
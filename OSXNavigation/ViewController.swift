//
//  ViewController.swift
//  OSXNavigation
//
//  Created by Marcin Jackowski on 12/01/16.
//  Copyright © 2016 Marcin Jackowski. All rights reserved.
//

import Foundation
import Cocoa

enum Operation {
    case Push, Pop
    
    var values: (first: Int, second: Int) {
        switch self {
        case .Push:
            return (0,1)
        case .Pop:
            return (1,0)
        }
    }
}

class ViewController: NSViewController {
    func popViewController(viewController: ViewController, currentViewController: ViewController) {
        setSegmentedControl(.Pop, currentViewController: nil)
        viewController.dismissViewController(currentViewController)
    }
    
    func pushViewController(viewController: ViewController) {
        let animator = CustomPresentationAnimator()
        setSegmentedControl(.Push, currentViewController: viewController)
        presentViewController(viewController, animator: animator)
    }
    
    private func setSegmentedControl(operation: Operation, currentViewController: ViewController?) {
        guard let window = NSApplication.sharedApplication().mainWindow?.windowController as? WindowViewController else { return }
        
        if let currentViewController = currentViewController {
            window.currentViewController = currentViewController
        }
        window.segmentedControl.setEnabled(true, forSegment: operation.values.first)
        window.segmentedControl.setEnabled(false, forSegment: operation.values.second)
    }
}
//
//  WindowViewController.swift
//  OSXNavigation
//
//  Created by Marcin Jackowski on 12/01/16.
//  Copyright © 2016 Marcin Jackowski. All rights reserved.
//

import Foundation
import Cocoa

class WindowViewController: NSWindowController {
    
    @IBOutlet weak var segmentedControl: NSSegmentedControl!
    
    var viewController: ViewController {
        get {
            return self.window!.contentViewController! as! ViewController
        }
    }
    
    var currentViewController: ViewController?
    
    @IBAction func controlNavigationAction(sender: NSSegmentedControl) {
        guard let currentViewController = currentViewController else { return }
        
        if sender.selectedSegment == 0 {
            sender.setEnabled(true, forSegment: 1)
            sender.setEnabled(false, forSegment: 0)
            
            viewController.popViewController(viewController, currentViewController: currentViewController)
        } else {
            viewController.pushViewController(currentViewController)
        }
    }
}
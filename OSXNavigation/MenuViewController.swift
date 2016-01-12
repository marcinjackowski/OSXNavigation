//
//  FirstViewController.swift
//  OSXNavigation
//
//  Created by Marcin Jackowski on 12/01/16.
//  Copyright © 2016 Marcin Jackowski. All rights reserved.
//

import Cocoa

class MenuViewController: ViewController {
    
    @IBAction func pushViewControllerButtonAction(sender: NSButton) {
        let testViewController = TestViewController()
        pushViewController(testViewController)
    }
}

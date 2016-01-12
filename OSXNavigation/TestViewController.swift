//
//  TestViewController.swift
//  OSXNavigation
//
//  Created by Marcin Jackowski on 12/01/16.
//  Copyright © 2016 Marcin Jackowski. All rights reserved.
//

import Cocoa

class TestViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popViewControllerButtonAction(sender: NSButton) {
        guard let presentingViewController = presentingViewController as? ViewController else { return }
        popViewController(presentingViewController, currentViewController: self)
    }
}

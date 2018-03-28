//
//  LoginViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {

    @IBOutlet weak var cancelBtn: NSButton!
    @IBOutlet weak var loginBtn: NSButton!
    
    @IBOutlet weak var username: NSTextField!
    @IBOutlet weak var password: NSTextField!

    var closingHandler: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        
        cancelBtn.setWhiteTitle("Cancel")
        loginBtn.setWhiteTitle("Login")
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.closingHandler?()
    }
    
    @IBAction func login(_ sender: Any) {
        
    }

    
}

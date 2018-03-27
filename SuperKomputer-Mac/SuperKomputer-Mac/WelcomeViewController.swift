//
//  ViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class WelcomeViewController: NSViewController {

    @IBOutlet weak var registerBtn: NSButton!
    @IBOutlet weak var loginBtn: NSButton!
    
    var registerViewController : RegisterViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        loginBtn.setWhiteTitle("Login")
        registerBtn.setWhiteTitle("Register")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func register(_ sender: Any) {
        
        guard self.registerViewController == nil else {
            print("Registration screen already present!!")
            return
        }
        
        registerViewController = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "register")) as? RegisterViewController
        registerViewController?.closingHandler = { [weak self] in
            self?.registerViewController?.view.removeFromSuperview()
            self?.registerViewController = nil
        }
        self.view.window?.contentView?.addSubview(registerViewController!.view)
        
        
    }
    
    @IBAction func login(_ sender: Any) {
        
    }
}


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
    var loginViewController : LoginViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        loginBtn.setWhiteTitle("Login")
        registerBtn.setWhiteTitle("Register")
        
        AppDelegate.instance.currentViewController = self
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
        guard self.loginViewController == nil else {
            print("Registration screen already present!!")
            return
        }
        
        loginViewController = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "login")) as? LoginViewController
        loginViewController?.closingHandler = { [weak self] in
            self?.loginViewController?.view.removeFromSuperview()
            self?.loginViewController = nil
        }
        self.view.window?.contentView?.addSubview(loginViewController!.view)
        
    }
}


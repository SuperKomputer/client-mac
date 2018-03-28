//
//  RegisterViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class RegisterViewController: NSViewController {

    @IBOutlet weak var linkWalletBtn: NSButton!
    @IBOutlet weak var cancelBtn: NSButton!
    @IBOutlet weak var registerBtn: NSButton!
    
    @IBOutlet weak var fullName: NSTextField!
    @IBOutlet weak var username: NSTextField!
    @IBOutlet weak var password: NSTextField!
    @IBOutlet weak var confirmPassword: NSTextField!
    @IBOutlet weak var walletLink: NSTextField!
    
    var closingHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        
        linkWalletBtn.setWhiteTitle("Link Wallet")
        cancelBtn.setWhiteTitle("Cancel")
        registerBtn.setWhiteTitle("Register")
    }
    
    @IBAction func linkWallet(_ sender: Any) {
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.closingHandler?()
    }
    
    @IBAction func register(_ sender: Any) {
        
        let user = User(inUserName: username.stringValue,
                        inFirstName: username.stringValue,
                        inLastName: username.stringValue,
                        userId: Int(Date().timeIntervalSince1970),
                        inEmail: "email@vmware.com")
        let creatUserParam = CreateUserRequestParam(user: user)
        
        let registerVM = RegisterViewModel()
        registerVM.createUser(param: creatUserParam) { (user) in
        
            //TODO: Handle navigationg to dashboard on succesfull login
        }
    }
}

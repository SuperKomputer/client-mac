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
    
    @IBOutlet weak var firstName: NSTextField!
    @IBOutlet weak var lastName: NSTextField!
    @IBOutlet weak var userName: NSTextField!
    @IBOutlet weak var email: NSTextField!
    @IBOutlet weak var password: NSTextField!
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
        
        let user = User(inUserName: userName.stringValue,
                        inFirstName: firstName.stringValue,
                        inLastName: lastName.stringValue,
                        userId: Int(Date().timeIntervalSince1970),
                        inEmail: email.stringValue)
        let creatUserParam = CreateUserRequestParam(user: user)
        
        let registerVM = RegisterViewModel()
        registerVM.createUser(param: creatUserParam) { (user) in
            guard user != nil else {
                return
            }
            
            UserDefaults.standard.setValue(user!.id, forKey: "user_id")
            UserDefaults.standard.synchronize()
            
            DispatchQueue.main.async {
                let dashboardViewController = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "dashboard")) as? DashboardViewController
                AppDelegate.instance.currentViewController = dashboardViewController        }

            }
    }
}

//
//  ViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

extension NSButton {
    func setWhiteTitle(_ title: String) {
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let font: NSFont = NSFont.systemFont(ofSize: 18)
        self.attributedTitle = NSAttributedString(string: title,
                                                  attributes: [NSAttributedStringKey.foregroundColor : NSColor.white,
                                                               NSAttributedStringKey.font : font,
                                                               NSAttributedStringKey.paragraphStyle: style])
    }
}

class WelcomeViewController: NSViewController {

    @IBOutlet weak var registerBtn: NSButton!
    @IBOutlet weak var loginBtn: NSButton!
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
        
    }
    
    @IBAction func login(_ sender: Any) {
        
    }
}


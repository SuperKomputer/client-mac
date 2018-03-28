//
//  DashboardViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class DashboardViewController: NSViewController {

    @IBOutlet weak var rentBtn: NSButton!
    @IBOutlet weak var requestBtn: NSButton!
    
    @IBOutlet weak var container: NSBox!

    var rentViewController : RentViewController?
    var requestViewController : RequestViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        
        rentBtn.setWhiteTitle("Rent a cluster")
        requestBtn.setWhiteTitle("Request a cluster")
        
        AppDelegate.instance.currentViewController = self
        
        setupChildControllers()
    }
    
    func setupChildControllers() {
        guard self.rentViewController == nil else {
            print("Rent screen already present!!")
            return
        }
        
        rentViewController = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "rent")) as? RentViewController
        rentViewController?.view.frame = container.bounds
        self.container.addSubview(rentViewController!.view)
        
        guard self.requestViewController == nil else {
            print("Request screen already present!!")
            return
        }
        
        requestViewController = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "request")) as? RequestViewController
        requestViewController?.view.frame = container.bounds
        self.container.addSubview(requestViewController!.view)
        requestViewController?.view.isHidden = true
    }
    
    @IBAction func rentACluster(_ sender: Any) {
        self.container.borderColor = NSColor(red: 91.0, green: 211.0, blue: 153.0, alpha: 1.0)
        rentViewController?.view.isHidden = false
        requestViewController?.view.isHidden = true
    }
    
    @IBAction func requestACluster(_ sender: Any) {
        self.container.borderColor = NSColor(red: 226.0, green: 180.0, blue: 247.0, alpha: 1.0)
        rentViewController?.view.isHidden = true
        requestViewController?.view.isHidden = false
    }

}

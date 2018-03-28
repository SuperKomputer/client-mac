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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        
        rentBtn.setWhiteTitle("Rent a cluster")
        requestBtn.setWhiteTitle("Request a cluster")
        
        AppDelegate.instance.currentViewController = self
    }
    
    @IBAction func rentACluster(_ sender: Any) {
        
    }
    
    @IBAction func requestACluster(_ sender: Any) {
        
    }

}

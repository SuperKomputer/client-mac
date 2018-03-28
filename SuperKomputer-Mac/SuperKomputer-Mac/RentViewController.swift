//
//  RentViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class RentViewController: NSViewController {

    @IBOutlet weak var clusterListView: NSTableView!
    
    @IBOutlet weak var rentBtn: NSButton!
    @IBOutlet weak var stopBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(red: 91.0, green: 211.0, blue: 153.0, alpha: 1.0).cgColor
    }
    
    @IBAction func rentMyCluster(_ sender: Any) {
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
    }
}

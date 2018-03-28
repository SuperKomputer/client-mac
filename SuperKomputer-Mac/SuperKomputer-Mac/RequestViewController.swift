//
//  RequestViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class RequestViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var clusterListView: NSTableView!
    @IBOutlet weak var requestBtn: NSButton!
    @IBOutlet weak var stopBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clusterListView.delegate = self
        clusterListView.dataSource = self
        
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(red: 226.0, green: 180.0, blue: 247.0, alpha: 1.0).cgColor
        self.clusterListView.backgroundColor = NSColor(red: 226.0, green: 180.0, blue: 247.0, alpha: 1.0)
    }
    
    @IBAction func requestCluster(_ sender: Any) {
        
    }
    
    @IBAction func stopCluster(_ sender: Any) {
        
    }
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let s: String = "r:\(row)/c::\(tableColumn!.identifier.rawValue)"
        return s
    }
}

//
//  RentViewController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class RentViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var clusterListView: NSTableView!
    
    @IBOutlet weak var rentBtn: NSButton!
    @IBOutlet weak var stopBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clusterListView.delegate = self
        clusterListView.dataSource = self
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(red: 91.0, green: 211.0, blue: 153.0, alpha: 1.0).cgColor
        
    }
    
    override func viewDidAppear() {
        clusterListView.reloadData()
    }
    
    @IBAction func rentMyCluster(_ sender: Any) {
        clusterListView.reloadData()
    }
    
    @IBAction func stop(_ sender: Any) {
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any?  {
        let s: String = "r:\(row)/c::\(tableColumn!.identifier.rawValue)"
        return s
    }

}

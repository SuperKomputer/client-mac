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
    
    var dataSource: [ClusterViewModel] = [ClusterViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clusterListView.delegate = self
        clusterListView.dataSource = self
        
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(red: 226.0, green: 180.0, blue: 247.0, alpha: 1.0).cgColor
        self.clusterListView.backgroundColor = NSColor(red: 226.0, green: 180.0, blue: 247.0, alpha: 1.0)
        
        ClusterListViewModel().getGlobalClusters { [weak self] (clustersViewModels) in
            if clustersViewModels.count > 0 {
                self?.dataSource.append(contentsOf: clustersViewModels)
                DispatchQueue.main.async {
                    self?.clusterListView.reloadData()
                }
            }
        }
    }
    
    @IBAction func requestCluster(_ sender: Any) {
        
    }
    
    @IBAction func stopCluster(_ sender: Any) {
        
    }
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let clusterViewModel: ClusterViewModel = self.dataSource[row]
        
        switch tableColumn!.identifier.rawValue {
        case "slno":
            return row + 1
        case "masters":
            return clusterViewModel.numOfmasters
        case "workers":
            return clusterViewModel.numOfWorkers
        case "status":
            return ((clusterViewModel.status.rawValue == 1) ? "Up" : "Down")
        case "clusterURI":
            return clusterViewModel.clusterURI
        default:
            return ""
        }
    }
}

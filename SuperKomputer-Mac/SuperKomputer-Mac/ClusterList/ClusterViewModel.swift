//
//  ClusterViewModel.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

enum ClusterStatus: Int{
    case up = 1
    case down = 0
}

protocol ClusterViewDataSource {
    var id: String { get }
    var numOfmasters: Int { get }
    var numOfWorkers: Int { get }
    var status: ClusterStatus { get }
    var clusterURI: String { get }
}

class ClusterViewModel: ClusterViewDataSource {
    
    var id: String {
        return cluster.clusterId
    }
    
    var numOfmasters: Int {
        return cluster.numMasters
    }
    
    var numOfWorkers: Int {
        return cluster.numWorkers
    }
    
    var status: ClusterStatus {
        return cluster.status == "active" ? .up : .down
    }
    
    var clusterURI: String{
        return cluster.uri
    }
    
    var cluster: Cluster
    init(inCluster: Cluster) {
        cluster = inCluster
    }
}

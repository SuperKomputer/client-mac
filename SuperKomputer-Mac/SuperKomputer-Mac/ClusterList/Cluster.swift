//
//  Cluster.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

class Cluster {
    var clusterId: String
    var numMasters: Int
    var numWorkers: Int
    var status: String
    var uri: String
    
    init(inClusterId: String,
         inNumMasters: Int,
         inNumWorkers: Int,
         inStatus: String,
         inUri: String) {
        
        clusterId = inClusterId
        numMasters = inNumMasters
        numWorkers = inNumWorkers
        status = inStatus
        uri = inUri
    }
}

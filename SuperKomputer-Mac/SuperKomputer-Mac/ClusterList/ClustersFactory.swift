//
//  ClustersFactory.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

class ClusterFactory {
    static func getClusters(from json: [String: Any]) -> [Cluster]{
        let clusters: [Cluster] = []
        if !JSONSerialization.isValidJSONObject(json) { return clusters }

        return clusters
    }
    
    
}

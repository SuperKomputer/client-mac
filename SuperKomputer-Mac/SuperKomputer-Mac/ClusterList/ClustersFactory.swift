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
        var clusters: [Cluster] = []
        if !JSONSerialization.isValidJSONObject(json) { return clusters }

        guard let clustersJson = json["items"] as? [[String: Any]] else { return clusters }
        
        for clusterJson in clustersJson {
            
            guard let clusterId = clusterJson["clusterId"] as? String else { break }
            guard let numOfMasters = clusterJson["numMasters"] as? Int else { break }
            guard let numOfWorkers = clusterJson["numWorkers"] as? Int else { break }
            guard let status = clusterJson["status"] as? String else { break }
            guard let uri = clusterJson["url"] as? String else { break }
            
            let cluster = Cluster(inClusterId: clusterId,
                                  inNumMasters: numOfMasters,
                                  inNumWorkers: numOfWorkers,
                                  inStatus: status,
                                  inUri: uri)
            clusters.append(cluster)
        }
        return clusters
    }
}

//
//  APICore+ClusterList.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

struct ClustersRequestParam {
    var userId: String
}

struct ClusterResponseParam {
    var success: Bool
    var clusters: [Cluster]
    var error: Error
}

let kClustersServerAPI = "\(kBaseURL)/users/{username}/clusters"

typealias getClustersBlock = (_ responseParam: ClusterResponseParam) -> Void

extension APICore {
    func getClusters(requestParam: ClustersRequestParam, callBack:getClustersBlock) {
        
    }
}

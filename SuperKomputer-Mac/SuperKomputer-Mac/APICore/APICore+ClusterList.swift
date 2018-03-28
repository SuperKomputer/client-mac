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
    var page: Int
}

struct ClusterResponseParam {
    var success: Bool
    var clusters: [Cluster]?
    var error: Error?
}

typealias GetClustersBlock = (_ responseParam: ClusterResponseParam) -> Void

extension APICore {
    func getClusters(requestParam: ClustersRequestParam, callBack:@escaping GetClustersBlock) {
     
        let urlString = kBaseURL.appending("/v1/users/\(requestParam.userId))/clusters")
        getClustersFor(urlString: urlString, callBack: callBack)
    }
    
    func getGlobalClusters(callBack:@escaping GetClustersBlock) {
        let urlString = kBaseURL.appending("/v1/clusters")

        getClustersFor(urlString: urlString, callBack: callBack)
    }
    
    private func getClustersFor(urlString: String, callBack: @escaping GetClustersBlock) {
        guard let url = URL(string: urlString)  else {
            let response = ClusterResponseParam(success: false,
                                                clusters: nil,
                                                error: nil)
            callBack(response)
            return
        }
        
        let session = URLSession.shared

        let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let newData = data else {
                let response = ClusterResponseParam(success: false,
                                                    clusters: nil,
                                                    error: nil)
                callBack(response)
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: newData, options: [])
            
            if let jsonResult = json as? [String:Any] {
                print(jsonResult)
                let clusters = ClusterFactory.getClusters(from: jsonResult)
                let response = ClusterResponseParam(success: true,
                                                    clusters: clusters,
                                                    error: nil)
                callBack(response)
            } else {
                let response = ClusterResponseParam(success: false,
                                                    clusters: nil,
                                                    error: nil)
                callBack(response)
            }
        })
        dataTask.resume()
    }
}

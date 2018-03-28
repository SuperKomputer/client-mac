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
    var clusters: [Cluster]?
    var error: Error?
}

typealias getClustersBlock = (_ responseParam: ClusterResponseParam) -> Void

extension APICore {
    func getClusters(requestParam: ClustersRequestParam, callBack:@escaping getClustersBlock) {
     
        let session = URLSession.shared
        let urlString = kBaseURL.appending("/users/\(requestParam.userId))/clusters")
        
        guard let url = URL(string: urlString)  else {
            let response = ClusterResponseParam(success: false,
                                                clusters: nil,
                                                error: nil)
            callBack(response)
            return
        }
        
        
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
            }
        })
        dataTask.resume()
        
    }
}

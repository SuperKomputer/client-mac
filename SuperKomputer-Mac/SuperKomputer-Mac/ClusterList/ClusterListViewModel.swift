//
//  ClustersListViewModel.swift
//  SuperKomputer-Mac
//
//  Created by Vinodh Swamy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Foundation

protocol ClusterListViewDatasource {
    var clusters: [ClusterViewModel] { get }
}

typealias ClustersViewModelBlock = (_ clustersViewModels: [ClusterViewModel]) -> Void


class ClusterListViewModel: ClusterListViewDatasource {
    var clusters: [ClusterViewModel] = []
    let apiCore = APICore()
    func getClusters(param: ClustersRequestParam, block: @escaping ClustersViewModelBlock) {
        apiCore.getClusters(requestParam: param) { [unowned self] (responseParam) in
            if responseParam.success {
                if let newClusters = responseParam.clusters {
                    self.clusters = self.getClusterViewModels(clusters: newClusters)
                }
                block(self.clusters)
            }
        }
    }
    
    func getGlobalClusters(block: @escaping ClustersViewModelBlock) {
        apiCore.getGlobalClusters(callBack: { [unowned self] (responseParam) in
            if responseParam.success {
                if let newClusters = responseParam.clusters {
                    self.clusters = self.getClusterViewModels(clusters: newClusters)
                }
                block(self.clusters)
            } else {
                //TODO: Handle Failed Case
            }
        })
    }
    
    func getClusterViewModels(clusters: [Cluster]) -> [ClusterViewModel] {
        var viewModels: [ClusterViewModel] = []
        for cluster in clusters {
            let clusterVM = ClusterViewModel(inCluster: cluster)
            viewModels.append(clusterVM)
        }
        return viewModels
    }
}

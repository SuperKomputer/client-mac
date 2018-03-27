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

class ClusterListViewModel: ClusterListViewDatasource {
    var clusters: [ClusterViewModel] = []
}

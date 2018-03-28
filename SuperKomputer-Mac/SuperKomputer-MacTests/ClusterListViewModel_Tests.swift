//
//  ClisterListViewModel_Tests.swift
//  SuperKomputer-MacTests
//
//  Created by Vinodh Swamy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import XCTest
@testable import SuperKomputer_Mac

class ClusterListViewModel_Tests: XCTestCase {

    var clustersViewModel: ClusterListViewModel?
    override func setUp() {
        super.setUp()
        if let path = Bundle(for: type(of: self)).url(forResource: "clusterList", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [String: Any] {
                    let clusters = ClusterFactory.getClusters(from: dictionary)
                    
                    let listVM = ClusterListViewModel()
                    listVM.clusters = listVM.getClusterViewModels(clusters: clusters)
                    clustersViewModel = listVM
                }
            } catch {
                
            }
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testClusterListVMForUser() {
        guard let viewModel = clustersViewModel else {
            XCTAssert(false, "ViewModel was not created")
            return
        }
        XCTAssertEqual(viewModel.clusters.count, 1)
    }
    
    func testClusterListVMForGlobal() {
        guard let viewModel = clustersViewModel else {
            XCTAssert(false, "ViewModel was not created")
            return
        }
        XCTAssertEqual(viewModel.clusters.count, 1)
    }
}

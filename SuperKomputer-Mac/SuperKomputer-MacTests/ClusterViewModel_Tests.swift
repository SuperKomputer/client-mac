//
//  ClusterViewModel_Tests.swift
//  SuperKomputer-MacTests
//
//  Created by Vinodh Swamy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import XCTest
@testable import SuperKomputer_Mac

class ClusterViewModel_Tests: XCTestCase {

    var viewModel: ClusterViewModel?
    
    override func setUp() {
        super.setUp()
        
        if let path = Bundle(for: type(of: self)).url(forResource: "clusterList", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [String: Any] {
                    let clusters = ClusterFactory.getClusters(from: dictionary)
                    viewModel = ClusterViewModel(inCluster: clusters[0])
                }
            } catch {
                
            }
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testID() {
        guard let clusterViewModel = viewModel else {
            XCTAssert(false, "ViewModel was not created")
            return
        }
        XCTAssertEqual(clusterViewModel.id, "test1.cluster")
    }
    
    func testNumOfmasters() {
        guard let clusterViewModel = viewModel else {
            XCTAssert(false, "ViewModel was not created")
            return
        }
        XCTAssertEqual(clusterViewModel.numOfmasters, 1)
    }
    
    func testNumOfWorkers() {
        guard let clusterViewModel = viewModel else {
            XCTAssert(false, "ViewModel was not created")
            return
        }
        XCTAssertEqual(clusterViewModel.numOfWorkers, 5)
    }
    
    func testStatus() {
        guard let clusterViewModel = viewModel else {
            XCTAssert(false, "ViewModel was not created")
            return
        }
        XCTAssertEqual(clusterViewModel.status, .up)
        
    }
    
    func testClusterURI() {
        guard let clusterViewModel = viewModel else {
            XCTAssert(false, "ViewModel was not created")
            return
        }
        XCTAssertEqual(clusterViewModel.clusterURI, "10.20.20.160")
    }
}

//
//  ClusterFactory_Tests.swift
//  SuperKomputer-MacTests
//
//  Created by Vinodh Swamy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import XCTest
@testable import SuperKomputer_Mac

class ClusterFactory_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testClusterFactoryClusters() throws {
        if let path = Bundle(for: type(of: self)).url(forResource: "clusterList", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [String: Any] {
                    let clusters = ClusterFactory.getClusters(from: dictionary)
                    XCTAssertEqual(clusters.count, 0)
                }
            }
        }
    }
}

//
//  FixterTests.swift
//  FixterTests
//
//  Created by Jim & Lisa on 9/30/15.
//  Copyright (c) 2015 Jim Witheril. All rights reserved.
//

import UIKit
import XCTest

class FixterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPullingData() {
        let expectation = self.expectationWithDescription("We pulled down the JSON.")
        Post.pullData { (posts, error) -> Void in
            XCTAssertNotNil(posts, "We have posts")
            expectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(7.0, handler: nil)
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}

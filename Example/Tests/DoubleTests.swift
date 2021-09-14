//
//  DoubleTests.swift
//  PadScreenFix_Tests
//
//  Created by jimmy on 2021/9/14.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import PadScreenFix

class DoubleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        XCTAssert(PadScreenFitConfig.uiTemplate.nativeSize.width == 1920)
        XCTAssert(100.0.fitInch == 100 * Double(UIScreen.main.bounds.size.height * 2) / 1920, "\(100.0.fitInch) -> \(100 * Double(UIScreen.main.bounds.size.height * 2) / 1920)")
        
        XCTAssert(100.0.p97(value: 125) == 125)
        
        UIFont.systemFont(ofSize: 10.fitFont)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  HelperClassTests.swift
//  AlignExamTests
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import XCTest
import Alamofire

class HelperClassTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testsaveTokenHeader(){
        saveTokenHeader(email: "test@email.com", token: "aaa")
        XCTAssertNotNil(getTokenHeader())
    }
    
    func testgetTokenHeader(){
        saveTokenHeader(email: "test@email.com", token: "aaa")
        XCTAssertEqual(String(describing: type(of: getTokenHeader())),String(describing:HTTPHeaders.self))
        
    }
    
    func testformatStringFromDate(){
        let someDateTime = Date(timeIntervalSinceReferenceDate: -123456789.0)
        let string = formatStringFromDate(date: someDateTime)
        XCTAssertEqual(string,"02/02/1997")
    }

}

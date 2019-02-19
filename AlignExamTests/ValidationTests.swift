//
//  ValidationTests.swift
//  AlignExamTests
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import XCTest

class ValidationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckMailEmpty(){
        let errorMessage = checkEmail(email: "")
        XCTAssertEqual(errorMessage, "Email cannot be empty")
    }
    
    func testCheckInalidEmail(){
        let errorMessage = checkEmail(email: "sddsasdasd")
        XCTAssertEqual(errorMessage, "Email not valid")
    }
    
    func testCheckValidEmail(){
        let errorMessage = checkEmail(email: "test@localhost.com")
        XCTAssertEqual(errorMessage, "")
    }
    
    func testCheckPasswordEmpty(){
        let errorMessage = checkPassword(password:"")
        XCTAssertEqual(errorMessage, "Password cannot be empty")
    }
    
    func testCheckPasswordInvalidLength(){
        let errorMessage = checkPassword(password:"1234")
        XCTAssertEqual(errorMessage, "Password must contain a minimum of 6 characters")
    }
    
    func testCheckPasswordValidLength(){
        let errorMessage = checkPassword(password:"123456")
        XCTAssertEqual(errorMessage, "")
    }
    
    func testCheckConfirmFirstPasswordEmpty(){
        let errorMessage = checkConfirmPassword(password: "", confirmPassword: "")
        XCTAssertEqual(errorMessage, "Password cannot be empty")
    }
    
    func testCheckConfirmFirstPasswordInvalidLength(){
        let errorMessage = checkConfirmPassword(password: "1234", confirmPassword: "")
        XCTAssertEqual(errorMessage, "Password must contain a minimum of 6 characters")
    }
    
    func testCheckConfirmFirstPasswordValidLength(){
        let errorMessage = checkConfirmPassword(password: "123456", confirmPassword: "")
        XCTAssertEqual(errorMessage, "Confirm Password cannot be empty")
    }
    
    func testCheckConfirmPasswordNotMatch(){
        let errorMessage = checkConfirmPassword(password: "123456", confirmPassword: "123654")
        XCTAssertEqual(errorMessage, "Password does not match")
    }
    
    func testCheckConfirmPasswordMatch(){
        let errorMessage = checkConfirmPassword(password: "123456", confirmPassword: "123456")
        XCTAssertEqual(errorMessage, "")
    }
    
}

//
//  RegistrationViewModelTests.swift
//  AlignExamTests
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import XCTest

class RegistrationViewModelTests: XCTestCase {

    var viewModel = RegistrationViewModel()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testgetParametersEmpty(){
        viewModel.email = "test@localhost.com"
        viewModel.password = "123456"
        viewModel.passwordConfirm = "123456"
        let actual = viewModel.getParameters()
        
        XCTAssertNotNil(actual)
    }
    
    func testgetParametersValues(){
        viewModel.email = "test@localhost.com"
        viewModel.password = "123456"
        viewModel.passwordConfirm = "123456"
        let actual = viewModel.getParameters()
        
        
        let expected:[String:Any] = ["user[email]":"test@localhost.com",
                                     "user[password]":"123456",
                                     "user[password_confirmation]":"123456"]
        
        XCTAssertEqual(expected.index(forKey:"user[email]"), actual.index(forKey:"user[email]"))
        XCTAssertEqual(expected.index(forKey:"user[password]"), actual.index(forKey:"user[password]"))
        XCTAssertEqual(expected.index(forKey:"user[password_confirmation]"), actual.index(forKey:"user[password_confirmation]"))
    }

    func testCheckMailEmpty(){
        viewModel.email = ""
        let errorMessage = viewModel.validate()
        XCTAssertEqual(errorMessage, "Email cannot be empty")
    }
    
    func testCheckInalidEmail(){
        viewModel.email = "random text"
        let errorMessage = viewModel.validate()
        XCTAssertEqual(errorMessage, "Email not valid")
    }
    
    func testCheckPasswordEmpty(){
        viewModel.email = "test@localhost.com"
        viewModel.password = ""
        let errorMessage = viewModel.validate()
        XCTAssertEqual(errorMessage, "Password cannot be empty")
    }
    
    func testCheckPasswordInvalidLength(){
        viewModel.email = "test@localhost.com"
        viewModel.password = "123"
        let errorMessage = viewModel.validate()
        XCTAssertEqual(errorMessage, "Password must contain a minimum of 6 characters")
    }
    
    func testCheckConfirmFirstPasswordValidLength(){
        viewModel.email = "test@localhost.com"
        viewModel.password = "123333"
        let errorMessage = viewModel.validate()
        XCTAssertEqual(errorMessage, "Confirm Password cannot be empty")
    }
    
    func testCheckConfirmPasswordNotMatch(){
        viewModel.email = "test@localhost.com"
        viewModel.password = "12222222"
        viewModel.passwordConfirm = "33232323"
        let errorMessage = viewModel.validate()
        XCTAssertEqual(errorMessage, "Password does not match")
    }
    
    func testCheckConfirmPasswordMatch(){
        viewModel.email = "test@localhost.com"
        viewModel.password = "111111"
        viewModel.passwordConfirm = "111111"
        let errorMessage = viewModel.validate()
        XCTAssertEqual(errorMessage, "")
    }

}

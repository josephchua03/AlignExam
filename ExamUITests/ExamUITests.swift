//
//  ExamUITests.swift
//  ExamUITests
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import XCTest

class ExamUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAppFirstLaunch(){
        let app = XCUIApplication()
    
        sleep(5)
        let emailTextField = app.textFields["Email"]
        let passwordTextField = app.secureTextFields["Password"]
        let buttonLogin = app.buttons["Login"]
        let buttonRegister = app.buttons["Register"]
        
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
        
        XCTAssertTrue(buttonLogin.exists)
        XCTAssertTrue(buttonRegister.exists)
        
    }
    
    func testLoginFieldValidation(){
        
        let app = XCUIApplication()
        
        sleep(2)
        let emailTextField = app.textFields["Email"]
        let buttonLogin = app.buttons["Login"]
        buttonLogin.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Email cannot be empty"].exists)
        sleep(3)
        emailTextField.tap()
        emailTextField.typeText("testlocal")
        buttonLogin.tap()
        XCTAssert(app.alerts.element.staticTexts["Email not valid"].exists)
    
    }
    
    func testPasswordFieldValidation(){
        
        let app = XCUIApplication()
        
        sleep(2)
        let emailTextField = app.textFields["Email"]
        let passwordTextField = app.secureTextFields["Password"]
        let buttonLogin = app.buttons["Login"]
        
        emailTextField.tap()
        emailTextField.typeText("test@local.com")
        buttonLogin.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Password cannot be empty"].exists)
        sleep(3)
        passwordTextField.tap()
        passwordTextField.typeText("te")
        buttonLogin.tap()
        XCTAssert(app.alerts.element.staticTexts["Password must contain a minimum of 6 characters"].exists)
        
        passwordTextField.tap()
        passwordTextField.typeText("testvalue")
        buttonLogin.tap()
        sleep(3)
        XCTAssert(app.staticTexts["Loading"].exists)
        
    }
}

//
//  LoginUITest.swift
//  TestingUITests
//
//  Created by Sasikumar on 10/11/20.
//

import XCTest

class LoginUITest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginPageShown() {
        let app = XCUIApplication()
        XCTAssertTrue(waitForElementToAppear(app.buttons["LOGINBUTTON"]))
    }
    func testEmailEmpty() {
        let app = XCUIApplication()
        if waitForElementToAppear(app.buttons["LOGINBUTTON"]) {
            let loginButton = app.buttons["LOGINBUTTON"]
            loginButton.tap()
            let errorLabel = app.staticTexts["ERRORLABEL"]
            XCTAssertTrue(errorLabel.label == "Please enter Email ID")
        }
    }
    func testEmailValid() {
        let app = XCUIApplication()
        if waitForElementToAppear(app.buttons["LOGINBUTTON"]) {
            let emailText = app.textFields["EMAILTEXTFIELD"]
            emailText.tap()
            emailText.typeText("sasi@")
            let loginButton = app.buttons["LOGINBUTTON"]
            loginButton.tap()
            let errorLabel = app.staticTexts["ERRORLABEL"]
            XCTAssertTrue(errorLabel.label == "The email id you entered is invalid")
        }
    }
    func testPasswordEmpty() {
        let app = XCUIApplication()
        if waitForElementToAppear(app.buttons["LOGINBUTTON"]) {
            let emailText = app.textFields["EMAILTEXTFIELD"]
            emailText.tap()
            emailText.typeText("sasi@test.com")
            let loginButton = app.buttons["LOGINBUTTON"]
            loginButton.tap()
            let errorLabel = app.staticTexts["ERRORLABEL"]
            XCTAssertTrue(errorLabel.label == "Please enter Password")
        }
    }
    func testBothEntered() {
        let app = XCUIApplication()
        if waitForElementToAppear(app.buttons["LOGINBUTTON"]) {
            let emailText = app.textFields["EMAILTEXTFIELD"]
            emailText.tap()
            emailText.typeText("sasi@test.com")
            let passwordText = app.secureTextFields["PASSWORDTEXTFIELD"]
            passwordText.tap()
            passwordText.typeText("Test@123")
            let loginButton = app.buttons["LOGINBUTTON"]
            loginButton.tap()
        }
    }
    public func waitForElementToAppear(_ element: XCUIElement, timeOut:TimeInterval = 15) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let expect = expectation(for: predicate, evaluatedWith: element, handler: nil)
        let result = XCTWaiter().wait(for: [expect], timeout: timeOut)
        return result == .completed
    }
}

//
//  LoginTest.swift
//  TestingTests
//
//  Created by Sasikumar on 10/11/20.
//

import XCTest
@testable import Testing
class LoginTest: XCTestCase {
    var loginViewController: LoginViewController?
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        loginViewController?.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        loginViewController = nil
    }
    
    func testEmailFieldOutletAdded() {
        //Check if Controller has Textfield property
        let emailTextField: UITextField? = loginViewController?.emailTextField
        XCTAssertNotNil(emailTextField, "Login ViewController does not have emailTextField property")
    }
    func testPasswordOutletAdded() {
        //Check if Controller has Password property
        let emailTextField: UITextField? = loginViewController?.passwordTextField
        XCTAssertNotNil(emailTextField, "Login ViewController does not have passwordTextField property")
    }
    func testErrorLabelAdded() {
        //Check if Controller has Error Label property
        let errorLabel: UILabel? = loginViewController?.errorLabel
        XCTAssertNotNil(errorLabel, "Login ViewController does not have errorLabel property")
    }
    func testLoginButtonActionAdded() {
        let loginButton: UIButton? = loginViewController?.loginButton
        XCTAssertNotNil(loginButton, "View Controller does not have UIButton property")
        
        // Attempt Access UIButton Actions
        guard let loginButtonActions = loginButton?.actions(forTarget: loginViewController, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        
        // Assert UIButton has action with a method name
        XCTAssertTrue(loginButtonActions.contains("loginButtonPressed:"))
    }
    func testEmptyEmail() {
        let loginViewModel = LoginViewModel()
        XCTAssertThrowsError(try loginViewModel.validateLogin(nil, password: nil), "Empty Email") { (error) in
            XCTAssertEqual(error as! LocalValidationError, LocalValidationError.emptyFieldEmail)
        }
    }
    func testInValidEmail() {
        let loginViewModel = LoginViewModel()
        XCTAssertThrowsError(try loginViewModel.validateLogin("sasi@", password: nil), "Valid Email") { (error) in
            XCTAssertEqual(error as! LocalValidationError, LocalValidationError.invalidEmail)
        }
    }
    func testEmptyPassword() {
        let loginViewModel = LoginViewModel()
        XCTAssertThrowsError(try loginViewModel.validateLogin("sasikumar@mobiotics.com", password: nil), "Empty Password") { (error) in
            XCTAssertEqual(error as! LocalValidationError, LocalValidationError.emptyFieldPassword)
        }
    }
    func testBothEmailPasswordValid() {
        let loginViewModel = LoginViewModel()
        do {
            XCTAssertTrue(try loginViewModel.validateLogin("sasikumar@mobiotics.com", password: "Test@123"))
        }
    }
}

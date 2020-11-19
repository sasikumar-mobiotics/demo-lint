//
//  LoginViewController.swift
//  Testing
//
//  Created by Sasikumar on 10/11/20.
//

import UIKit
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessbilityIdentifier()
    }
    private func setAccessbilityIdentifier() {
        emailTextField.accessibilityIdentifier = "EMAILTEXTFIELD"
        passwordTextField.accessibilityIdentifier = "PASSWORDTEXTFIELD"
        errorLabel.accessibilityIdentifier = "ERRORLABEL"
        loginButton.accessibilityIdentifier = "LOGINBUTTON"
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        callLogin()
    }
    func callLogin() {
        do {
            if try loginViewModel.validateLogin(emailTextField.text, password: passwordTextField.text) {
                print("success")
            }
        } catch {
            if let error = error as? LocalValidationError {
                self.errorLabel.text = error.description
            }
        }
    }
}


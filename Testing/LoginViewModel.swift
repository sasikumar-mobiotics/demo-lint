//
//  LoginModel.swift
//  Testing
//
//  Created by Sasikumar on 10/11/20.
//

import UIKit

class LoginViewModel: NSObject {
    func validateLogin(_ email: String?, password:String?) throws -> Bool {
        guard try emailIdValidation(email) else {
            return try emailIdValidation(email)
        }
        guard isPasswordNotEmpty(password) else {
            throw LocalValidationError.emptyFieldPassword
        }
        return true
    }
    private func hasValidEmail(_ text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    private func emailIdValidation(_ email:String?) throws -> Bool {
        guard isEmailNotEmpty(email) else {
            throw LocalValidationError.emptyFieldEmail
        }
        guard hasValidEmail(email ?? "") else {
            throw LocalValidationError.invalidEmail
        }
        return true
    }
    private func isEmailNotEmpty(_ email:String?) -> Bool {
        return !(email?.isEmpty ?? true)
    }
    private func isPasswordNotEmpty(_ password: String?) -> Bool {
        return !(password?.isEmpty ?? true)
    }
}

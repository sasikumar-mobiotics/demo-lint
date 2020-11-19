//
//  LocalValidationError.swift
//  Testing
//
//  Created by Sasikumar on 10/11/20.
//

import UIKit

enum LocalValidationError: Error, CustomStringConvertible {
    /// If Email Field is empty
    case emptyFieldEmail
    /// If Password Field is empty
    case emptyFieldPassword
    /// If Email Field is invalid. Entered Email should match with this
    ///regex **[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}**
    case invalidEmail
    /// If Password Field is invalid. which means entered password should be 6-16 character long
    case invalidPassword
    var description: String {
        switch self {
        case .emptyFieldEmail:
            return "Please enter Email ID"
        case .emptyFieldPassword:
            return "Please enter Password"
        case .invalidEmail:
            return "The email id you entered is invalid"
        case .invalidPassword:
            return "Password should be 6-16 character long"
        }
    }
    /// To get the error code particular local validation error
    var errorCode: Int {
        switch self {
        case .emptyFieldEmail:
            return 9001
        case .emptyFieldPassword:
            return 9002
        case .invalidEmail:
            return 9003
        case .invalidPassword:
            return 9004
        }
    }
}

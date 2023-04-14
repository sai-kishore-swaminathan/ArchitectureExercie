//
//  LoginPresenterMvpInput.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 09/04/23.
//

import Foundation

public protocol LoginViewInputMvp {
    func didObtainValidationResult(result: ValidationResult)
}

public enum ValidationResult {
    case invalidEmail
    case invalidLength
    case invalidPassword
    case success
    case empty
}

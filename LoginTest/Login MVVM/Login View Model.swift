//
//  Login View Model.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 09/04/23.
//

import Foundation
import UIKit

/*
 Presenter knows nothing about the state but View Model does
 */


public final class LoginViewModel {

    var errorDescription: String? {
        didSet
        {
            bindViewModelToController()
        }
    }

    var errorDescriptionColor: UIColor = .gray

    public init() {
        self.errorDescription = "Enter Login Information"
    }

    public func didTapLoginButton(email: String?, password: String?) {
        guard let email = email,
              let _ = password else {
            updateErrorDescription(result: .empty)
            return
        }


        if Validator.isValidEmail(email) {
            updateErrorDescription(result: .success)
        } else {
            updateErrorDescription(result: .invalidEmail)
        }
        // Other common responsibilities after clicking login

        // Login info Validation ( Network calls )
        // Storing information to DB ( DB objects )
        // Fetching stuff from APIs (Different Services)
        // Re routing to different module (Calling different modules )
    }

    private func updateErrorDescription(result: ValidationResult) {
        if result == .success {
            errorDescriptionColor = .green
        } else {
            errorDescriptionColor = .red
        }

        switch result {
        case .invalidEmail:
            errorDescription = "This is not a valid mail id"
        case .invalidLength:
            errorDescription = "This is not a valid mail length"
        case .invalidPassword:
            errorDescription = "This is not a valid password"
        case .success:
            errorDescription = "Login successful"
        case .empty:
            errorDescription = "Enter all Fields"
        }
    }

    // No different than a callback 
    var bindViewModelToController: (() -> ()) = {}
    
}

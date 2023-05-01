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

    public var loginModel: LoginModel

    var errorDescription: String? {
        didSet
        {
            bindViewModelToController()
        }
    }

    var errorDescriptionColor: UIColor = .gray

    public init(model: LoginModel) {
        self.errorDescription = "Enter Login Information"
        self.loginModel = model
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

        loginModel.performLogin { result in
            switch result {
            case .success(_):
                // go to next MVP from here
                // Presenter will hold reference to the next VC
                // ROUTING HAPPENS HERE
                let vc = "DummyViewController"
            case .failure(_):
                // Display error
                print("Failure")
            }
        }
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

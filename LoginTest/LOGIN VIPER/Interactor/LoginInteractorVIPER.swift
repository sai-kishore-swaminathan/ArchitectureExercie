//
//  LoginInteractorVIPER.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 12/04/23.
//

import Foundation

final class LoginInteractorViper: LoginPresenterViperOutput {

    var presenter: LoginPresenterViperInput?


    func didTapLoginButton(text: String?) {
        guard let text = text,
              !text.isEmpty else {
            // Return empty
            presenter?.didFinishValidation(state: .emptyFields)
            return 
        }

        if Validator.isValidEmail(text) {
            presenter?.didFinishValidation(state: .success)
        } else {
            presenter?.didFinishValidation(state: .incorrectPassword)
        }

        // Other common responsibilities after clicking login

        // Login info Validation ( Network calls )
        // Storing information to DB ( DB objects )
        // Fetching stuff from APIs (Different Services)
        // Re routing to different module (Calling different modules )
    }
    
}

// We can pass this to router to login in to the app
public enum LoginViperState {
    case loggedin
    case loggedout
}

public enum LoginViperDescription {
    case emptyFields
    case success
    case incorrectPassword
}

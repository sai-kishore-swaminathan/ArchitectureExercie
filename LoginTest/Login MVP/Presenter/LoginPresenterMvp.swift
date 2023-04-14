//
//  LoginPresenterMvp.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 09/04/23.
//

import Foundation
/*

 Presenter Responsibilities:
    - Handles all logic Related to the particular module 

 */

public final class LoginPresenterMvp: LoginViewOutputMvp {

    private var view: LoginViewInputMvp

    init(view: LoginViewInputMvp) {
        self.view = view
    }

    // MARK: - Login Action Logic
    
    public func didTapLoginButton(email: String?, password: String?) {
        guard let email = email,
              let _ = password else {
            view.didObtainValidationResult(result: .empty)
            return
        }


        if Validator.isValidEmail(email) {
            view.didObtainValidationResult(result: .success)
        } else {
            view.didObtainValidationResult(result: .invalidEmail)
        }
        // Other common responsibilities after clicking login

        // Login info Validation ( Network calls )
        // Storing information to DB ( DB objects )
        // Fetching stuff from APIs (Different Services)
        // Re routing to different module (Calling different modules )
    }
}


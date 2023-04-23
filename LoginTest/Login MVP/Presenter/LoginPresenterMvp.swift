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
    private var model: LoginModel

    init(view: LoginViewInputMvp, model: LoginModel) {
        self.view = view
        self.model = model
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

        model.performLogin { result in
            switch result {
            case .success(_):
                // go to next MVP from here
                // Presenter will hold reference to the next VC
                let vc = "DummyViewController"
            case .failure(_):
                // Display error
                print("Failure")
            }
        }

    }
}


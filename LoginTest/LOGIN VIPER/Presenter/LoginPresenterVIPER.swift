//
//  LoginPresenterVIPER.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 12/04/23.
//

import Foundation
import UIKit

final class LoginPresenterViper: LoginViewViperOutput,
                                 LoginPresenterViperInput {


    var router: LoginViperRouterInput?
    var interactor: LoginPresenterViperOutput? = nil
    var view: LoginViewViperInput? = nil

    func didTapLoginButton(text: String?) {
        interactor?.didTapLoginButton(text: text)
    }

    func didFinishValidation(state: LoginViperDescription) {
        switch state {
        case .emptyFields:
            view?.didFinishValidation(text: "Field is empty", color: .red)
        case .success:
            view?.didFinishValidation(text: "Login Success", color: .green)
            router?.didFinishLogin()
        case .incorrectPassword:
            view?.didFinishValidation(text: "Incorrect Password", color: .red)
        }
    }
}

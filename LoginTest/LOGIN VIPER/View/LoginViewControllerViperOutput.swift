//
//  LoginViewControllerViperOutput.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 14/04/23.
//

import Foundation

public protocol LoginViewViperOutput: AnyObject {
    var view: LoginViewViperInput? {get set}
    var interactor: LoginPresenterViperOutput? {get set}
    var router: LoginViperRouterInput? {get set}
    func didTapLoginButton(text: String?)
}

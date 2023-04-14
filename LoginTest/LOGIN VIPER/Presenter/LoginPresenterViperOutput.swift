//
//  LoginPresenterViperOutput.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 14/04/23.
//

import Foundation

public protocol LoginPresenterViperOutput: AnyObject {
    var presenter: LoginPresenterViperInput? {get set}
    func didTapLoginButton(text: String?)
}

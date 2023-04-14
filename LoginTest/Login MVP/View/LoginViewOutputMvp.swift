//
//  LoginPresenterMvpOutput.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 09/04/23.
//

import Foundation

public protocol LoginViewOutputMvp {
    func didTapLoginButton(email: String?, password: String?)
}


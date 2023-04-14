//
//  LoginPresneterViperInput.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 14/04/23.
//

import Foundation

public protocol LoginPresenterViperInput {
    func didFinishValidation(state: LoginViperDescription)
}

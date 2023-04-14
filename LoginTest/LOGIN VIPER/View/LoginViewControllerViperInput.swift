//
//  LoginViewControllerViperInput.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 14/04/23.
//

import Foundation
import UIKit

public protocol LoginViewViperInput {
    var presenter: LoginViewViperOutput? {get set}
    func didFinishValidation(text: String, color: UIColor)
}

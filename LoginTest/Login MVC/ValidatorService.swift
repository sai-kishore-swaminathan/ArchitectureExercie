//
//  Validator.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 09/04/23.
//

import Foundation

public final class Validator {
    public static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

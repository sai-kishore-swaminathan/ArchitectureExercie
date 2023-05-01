//
//  LoginRouterViperInput.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 14/04/23.
//

import Foundation

public protocol LoginViperRouterInput {
    func didFinishLogin()
}

public protocol LoginViperRouterOutput {
    func performLogin(completion: @escaping (Result<Data, Error>) -> Void)
}

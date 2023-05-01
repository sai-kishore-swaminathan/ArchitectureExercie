//
//  LoginEntityViper.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 12/04/23.
//

import Foundation

public final class LoginEntity: LoginViperRouterOutput {
    // Other data related to the model

    // Network Functions
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    public func performLogin(completion: @escaping (Result<Data, Error>) -> Void) {
        // Some request sent to BE ( Doesn't matter what request )
        networkService.fetchData { result in
            completion(result)
        }
    }
}

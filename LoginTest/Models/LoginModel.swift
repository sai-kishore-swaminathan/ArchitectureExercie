//
//  LoginModel.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 23/04/23.
//

import Foundation


// Netowork related calls lies in the model layer in MVP

public final class LoginModel {
    // Other data related to the model

    // Network Functions 
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func performLogin(completion: @escaping (Result<Data, Error>) -> Void) {
        // Some request sent to BE ( Doesn't matter what request )
        networkService.fetchData { result in
            completion(result)
        }
    }
}

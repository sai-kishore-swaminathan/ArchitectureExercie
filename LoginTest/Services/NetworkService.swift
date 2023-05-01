//
//  NetworkService.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 23/04/23.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void)
}


// Implement the network service using URLSession
class NetworkService: NetworkServiceProtocol {
    static let shared: NetworkServiceProtocol = NetworkService()

    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://example.com/data.json") else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            completion(.success(data))
        }.resume()
    }
}

// Define an enum for network errors
enum NetworkError: Error {
    case invalidUrl
    case noData
}

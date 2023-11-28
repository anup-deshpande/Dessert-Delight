//
//  NetworkService.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/6/23.
//

import UIKit

enum APIError: Error {
    case invalidData
    case invalidResponse
    case noDataFound
}

protocol NetworkServiceProtocol {
    func fetch<T : Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func fetch<T : Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.invalidResponse))
                return
            }

            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(APIError.invalidData))
            }
        }

        task.resume()
    }
}
 

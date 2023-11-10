//
//  NetworkService.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/6/23.
//

import UIKit
import Alamofire

enum APIError: Error {
    case invalidData
    case invalidResponse
}

protocol NetworkServiceProtocol {
    func getMealList(completion: @escaping (Result<MealListResponse, Error>) -> Void)
    func getMealDetails(mealID: String, completion: @escaping (Result<MealListResponse?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getMealList(completion: @escaping (Result<MealListResponse, Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!

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
                let mealListResponse = try JSONDecoder().decode(MealListResponse.self, from: data)
                completion(.success(mealListResponse))
            } catch {
                completion(.failure(APIError.invalidData))
            }
        }

        task.resume()
    }

    
    func getMealDetails(mealID: String, completion: @escaping (Result<MealListResponse?, Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")!
        AF.request(url).response { response in
            do {
                let mealListResponse = try JSONDecoder().decode(MealListResponse.self, from: response.data!)
                completion(.success(mealListResponse))
            } catch {
                print("Error getting mealList from api: \(error)")
                completion(.failure(error))
            }
        }
    }
}
 

//
//  NetworkService.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/6/23.
//

import UIKit
import Alamofire
import SwiftyBeaver

class NetworkService {
    
    static var shared = NetworkService()
    
    func getMealList( completion: @escaping (Result<MealListResponse?, Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        AF.request(url).response { response in
            do {
                print("Received data from the API: \(response.data)")
                let mealListResponse = try JSONDecoder().decode(MealListResponse.self, from: response.data!)
                completion(.success(mealListResponse))
            } catch {
                print("Error getting mealList from api: \(error)")
                completion(.failure(error))
            }
            
        }
    }
}
 

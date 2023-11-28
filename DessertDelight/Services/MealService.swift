//
//  MealService.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/27/23.
//

import Foundation

protocol MealServiceProtocol {
    func getMealList(completion: @escaping (Result<MealListResponse, Error>) -> Void)
    func getMealDetails(mealID: String, completion: @escaping (Result<MealListResponse, Error>) -> Void)
}

final class MealService: MealServiceProtocol {
    
    private var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getMealList(completion: @escaping (Result<MealListResponse, Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        networkService.fetch(url: url, completion: completion)
    }

    func getMealDetails(mealID: String, completion: @escaping (Result<MealListResponse, Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)")!
        networkService.fetch(url: url, completion: completion)
    }
}

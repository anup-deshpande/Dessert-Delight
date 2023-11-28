//
//  NetworkServiceMock.swift
//  DessertDelightTests
//
//  Created by Anup Deshpande on 11/10/23.
//

import Foundation
@testable import DessertDelight

final class MealServiceMock: MealServiceProtocol {
    var getMealListStub: ((@escaping (Result<MealListResponse, Error>) -> Void) -> Void)!
    
    func getMealList(completion: @escaping (Result<MealListResponse, Error>) -> Void) {
        getMealListStub(completion)
    }
    
    var getMealDetailsStub: ((String, @escaping (Result<MealListResponse, Error>) -> Void) -> Void)!
    
    func getMealDetails(mealID: String, completion: @escaping (Result<MealListResponse, Error>) -> Void) {
        getMealDetailsStub(mealID, completion)
    }
}

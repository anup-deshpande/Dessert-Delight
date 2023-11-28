//
//  DetailViewModel.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/10/23.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func mealUpdated()
}

final class DetailViewModel {
    //MARK: - Dependencies
    private let networkService: NetworkServiceProtocol
    
    //MARK: - Properties
    weak var delegate: DetailViewModelDelegate?
    var mealId: String
    var meal: Meal?
    
    init(mealId: String, delegate: DetailViewModelDelegate, networkService: NetworkServiceProtocol) {
        self.mealId = mealId
        self.delegate = delegate
        self.networkService = networkService
        updateMeal()
    }
    
    //MARK: - helper functions
    
    private func updateMeal() {
        networkService.getMealDetails(mealID: mealId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let mealListResponse):
                meal = mealListResponse?.meals.first
                delegate?.mealUpdated()
            case .failure(let error):
                print("Error fetching API data: \(error)")
            }
        }
    }
    
}

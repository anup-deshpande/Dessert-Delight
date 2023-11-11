//
//  HomeViewModel.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/10/23.
//

import Foundation

protocol HomeViewModelDelegate {
    func mealListUpdated()
}

final class HomeViewModel {
    //MARK: - Dependencies
    private let networkService: NetworkServiceProtocol
    
    //MARK: - Properties
    var delegate: HomeViewModelDelegate?
    var mealList = [Meal]()
    
    init(delegate: HomeViewModelDelegate, networkService: NetworkServiceProtocol) {
        self.delegate = delegate
        self.networkService = networkService
        updateMealList()
    }
    
    public func getMealItem(for index: Int) -> Meal? {
        mealList[index]
    }
    
    //MARK: - helper functions
    
    /// fetch meal list and store it in ascending order
    private func updateMealList() {
        networkService.getMealList { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let mealListResponse):
                mealList = mealListResponse.meals.sorted(by: { $0.meal < $1.meal })
                delegate?.mealListUpdated()
            case .failure(let error):
                print("Error fetching API data: \(error)")
            }
        }
    }

}

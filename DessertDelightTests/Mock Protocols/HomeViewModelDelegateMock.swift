//
//  HomeViewModelDelegateMock.swift
//  DessertDelightTests
//
//  Created by Anup Deshpande on 11/10/23.
//

import Foundation
@testable import DessertDelight

final class HomeViewModelDelegateMock: HomeViewModelDelegate {
    
    var mealListUpdatedStub: (() -> Void)!
    
    func mealListUpdated() {
        mealListUpdatedStub()
    }
}

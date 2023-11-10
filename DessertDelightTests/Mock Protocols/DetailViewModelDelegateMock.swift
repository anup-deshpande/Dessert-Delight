//
//  DetailViewModelDelegateMock.swift
//  DessertDelightTests
//
//  Created by Anup Deshpande on 11/10/23.
//

import Foundation
@testable import DessertDelight

final class DetailViewModelDelegateMock: DetailViewModelDelegate {
    
    var mealUpdatedStub: (() -> Void)!
    
    func mealUpdated() {
        mealUpdatedStub()
    }
}

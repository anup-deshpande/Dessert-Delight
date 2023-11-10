//
//  DetailViewModelTests.swift
//  DessertDelightTests
//
//  Created by Anup Deshpande on 11/10/23.
//

@testable import DessertDelight
import XCTest

final class DetailViewModelTests: XCTestCase {
    //MARK: - Properties
    
    private var detailViewModelDelegateMock: DetailViewModelDelegateMock!
    private var networkServiceMock: NetworkServiceMock!
    
    //MARK: - Override
    
    override func setUp() {
        super.setUp()
        
        networkServiceMock = NetworkServiceMock()
        detailViewModelDelegateMock = DetailViewModelDelegateMock()
    }
    
    override func tearDown() {
        super.tearDown()
        
        // deinit
        networkServiceMock = nil
        detailViewModelDelegateMock = nil
    }
    
    //MARK: - Tests
    func testUpdateMeal() throws {
        // Arrange
        var didCallMealUpdatedMethod = false
        let mealId = "52893"
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "MealDetails", withExtension: "json") else {
            XCTFail("Missing file: MealDetails.json")
            return
        }
        
        let json = try Data(contentsOf: url)
        let mealResponse = try JSONDecoder().decode(MealListResponse.self, from: json)
        
        networkServiceMock.getMealDetailsStub = { mealID, completion in
            XCTAssertEqual(mealId, mealID)
            completion(.success(mealResponse))
        }
        
        detailViewModelDelegateMock.mealUpdatedStub = {
            didCallMealUpdatedMethod = true
        }
        
        // Act
        let detailViewModel = DetailViewModel(mealId: mealId, delegate: detailViewModelDelegateMock, networkService: networkServiceMock)
        let meal = try XCTUnwrap(detailViewModel.meal)
        
        // Assert
        XCTAssertEqual(meal.measurements.count, 9)
        XCTAssertTrue(didCallMealUpdatedMethod)
    }
    
    func testUpdateMeal_returnsFailure() throws {
        // Arrange
        let mealId = "52893"
        var didCallMealUpdatedMethod = false
        networkServiceMock.getMealDetailsStub = { _, completion in
            completion(.failure(APIError.invalidData))
        }
        
        detailViewModelDelegateMock.mealUpdatedStub = {
            didCallMealUpdatedMethod = true
        }
        
        // Act
        let detailViewModel = DetailViewModel(mealId: mealId, delegate: detailViewModelDelegateMock, networkService: networkServiceMock)
        
        // Assert
        XCTAssertNil(detailViewModel.meal)
        XCTAssertFalse(didCallMealUpdatedMethod)
    }
}

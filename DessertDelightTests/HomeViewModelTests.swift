//
//  HomeViewModelTests.swift
//  DessertDelightTests
//
//  Created by Anup Deshpande on 11/10/23.
//

@testable import DessertDelight
import XCTest

final class HomeViewModelTests: XCTestCase {
    //MARK: - Properties
    
    private var homeViewModelDelegateMock: HomeViewModelDelegateMock!
    private var networkServiceMock: NetworkServiceMock!
    
    //MARK: - Override
    
    override func setUp() {
        super.setUp()
        
        networkServiceMock = NetworkServiceMock()
        homeViewModelDelegateMock = HomeViewModelDelegateMock()
    }
    
    override func tearDown() {
        super.tearDown()
        
        // deinit
        networkServiceMock = nil
        homeViewModelDelegateMock = nil
    }
    
    //MARK: - Tests
    func testUpdateMealList() throws {
        // Arrange
        var didCallMealListUpdatedMethod = false
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "DessertList", withExtension: "json") else {
            XCTFail("Missing file: DessertList.json")
            return
        }
        
        let json = try Data(contentsOf: url)
        let mealListResponse = try JSONDecoder().decode(MealListResponse.self, from: json)
        
        networkServiceMock.getMealListStub = { completion in
            completion(.success(mealListResponse))
        }
        
        homeViewModelDelegateMock.mealListUpdatedStub = {
            didCallMealListUpdatedMethod = true
        }
        
        // Act
        let homeViewModel = HomeViewModel(delegate: homeViewModelDelegateMock, networkService: networkServiceMock)
        
        let secondMealItem = try XCTUnwrap(homeViewModel.getMealItem(for: 1))
        
        
        // Assert
        XCTAssertEqual(homeViewModel.mealList.count, 65)
        XCTAssertEqual(secondMealItem.meal, "Apple & Blackberry Crumble")
        XCTAssertEqual(secondMealItem.id, "52893")
        XCTAssertEqual(secondMealItem.thumbnail, "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
        XCTAssertTrue(didCallMealListUpdatedMethod)
    }
    
    func testUpdateMealList_returnsFailure() throws {
        // Arrange
        var didCallMealListUpdatedMethod = false
        networkServiceMock.getMealListStub = { completion in
            completion(.failure(APIError.invalidResponse))
        }
        
        homeViewModelDelegateMock.mealListUpdatedStub = {
            didCallMealListUpdatedMethod = true
        }
        
        // Act
        let homeViewModel = HomeViewModel(delegate: homeViewModelDelegateMock, networkService: networkServiceMock)
        
        // Assert
        XCTAssertEqual(homeViewModel.mealList.count, 0)
        XCTAssertFalse(didCallMealListUpdatedMethod)
    }

}

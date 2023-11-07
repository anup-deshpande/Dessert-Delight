//
//  Meal.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/6/23.
//

import Foundation

struct Meal: Codable {
    var id: String
    var meal: String
    var thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case meal = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

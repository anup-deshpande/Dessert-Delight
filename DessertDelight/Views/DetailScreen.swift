//
//  DetailScreen.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/26/23.
//

import SwiftUI

struct DetailScreen: View {
    var meals = [
        Meal(id: "100", meal: "abcd", thumbnail: "https://media.istockphoto.com/id/178462137/photo/croissant-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=LutFvlHRRKkLHaFXUl6f0l0QpMRXwKbz6b6FNauCKsU="),
        Meal(id: "101", meal: "abcd", thumbnail: "https://media.istockphoto.com/id/178462137/photo/croissant-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=LutFvlHRRKkLHaFXUl6f0l0QpMRXwKbz6b6FNauCKsU="),
        Meal(id: "102", meal: "abcd", thumbnail: "https://media.istockphoto.com/id/178462137/photo/croissant-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=LutFvlHRRKkLHaFXUl6f0l0QpMRXwKbz6b6FNauCKsU="),
    ]
    
    var body: some View {
        Text("Hello, SwiftUI!")
        
        List(meals) { meal in
            MealListCell(meal: meal)
        }
    }
}

#Preview {
    DetailScreen()
}

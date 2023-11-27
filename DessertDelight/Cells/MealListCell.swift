//
//  MealListCell.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/26/23.
//

import SwiftUI
import Kingfisher

struct MealListCell: View {
    var meal: Meal
    
    var body: some View {
        HStack {
            KFImage(URL(string: meal.thumbnail))
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(meal.meal)
            
            Spacer()
        }
    }
}

#Preview {
    MealListCell(meal: Meal(id: "1023",
                            meal: "Crossiant",
                            thumbnail: "https://media.istockphoto.com/id/178462137/photo/croissant-isolated-on-white.jpg?s=1024x1024&w=is&k=20&c=LutFvlHRRKkLHaFXUl6f0l0QpMRXwKbz6b6FNauCKsU=")
    )
}

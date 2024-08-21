//
//  Meals.swift
//  browse-recipes
//
//  Created by Oforkanji Odekpe on 8/21/24.
//

import Foundation

// MARK: - Meals
struct Meals: Codable {
    let meals: [Meal]
    
    init(meals: [Meal]) {
        self.meals = meals
    }
    
    struct Meal: Codable, Identifiable, Hashable {
        let name: String
        let thumbnail: String
        let id: String
        
        enum CodingKeys: String, CodingKey {
            case name = "strMeal"
            case thumbnail = "strMealThumb"
            case id = "idMeal"
        }
        
        init(name: String, thumbnail: String, id: String) {
            self.name = name
            self.thumbnail = thumbnail
            self.id = id
        }
    }
}

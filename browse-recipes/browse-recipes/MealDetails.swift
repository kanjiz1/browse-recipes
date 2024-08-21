//
//  MealDetails.swift
//  browse-recipes
//
//  Created by Oforkanji Odekpe on 8/21/24.
//

import Foundation

struct Ingredients: Hashable {
    let ingredient: String
    let measure: String
}

struct MealDetails: Codable {
    private let details: [[String: String?]]?
    
    var name: String? {
        details?.first?
            .compactMapValues { $0 }[Keys.name.rawValue]
    }
    
    var instruction: String? {
        details?.first?
            .compactMapValues { $0 }[Keys.instructions.rawValue]
    }
    
    var ingredients: [Ingredients] {
        guard let mealData = details?.first else {
            return []
        }
        
        let mealDetails = mealData.compactMapValues { $0 }
        var ingredients: [Ingredients] = []
        for (ingredientKey, measureKey) in zip(IngredientKeys.allCases, MeasureKeys.allCases) {
            if let ingredient = mealDetails[ingredientKey.rawValue],
               let measure = mealDetails[measureKey.rawValue],
               !ingredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
               !measure.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                ingredients.append(.init(ingredient: ingredient, measure: measure))
            }
        }
        
        return ingredients
    }
    
    enum CodingKeys: String, CodingKey {
        case details = "meals"
    }
    
    private enum Keys: String, CaseIterable {
        case name = "strMeal"
        case instructions = "strInstructions"
    }
    
    private enum IngredientKeys: String, CaseIterable {
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
    }
    
    private enum MeasureKeys: String, CaseIterable {
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }
    
    init(details: [[String : String?]]?) {
        self.details = details
    }
}

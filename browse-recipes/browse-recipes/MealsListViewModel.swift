//
//  MealsListViewModel.swift
//  browse-recipes
//
//  Created by Oforkanji Odekpe on 8/21/24.
//

import Foundation
@MainActor final class MealListViewModel: ObservableObject {

    @Published var meals: [Meals.Meal] = []
    private let service = MealsService()
    
    func fetchMealList() {
        Task {
            let fetchedList = try await service.fetchMealList()
            self.meals = fetchedList.meals.sorted(by: { $0.name < $1.name })
        }
    }
}

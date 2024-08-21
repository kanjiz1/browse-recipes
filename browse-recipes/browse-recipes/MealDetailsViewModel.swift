//
//  MealDetailsViewModel.swift
//  browse-recipes
//
//  Created by Oforkanji Odekpe on 8/21/24.
//

import Foundation

@MainActor final class MealDetailsViewModel: ObservableObject {
    @Published var details: MealDetails? = nil
    private let service = MealsService()
    private let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func fetchMealDetails() {
        Task {
            let fetchedDetails = try await service.fetchMealDetails(id: id)
            self.details = fetchedDetails
        }
    }
}

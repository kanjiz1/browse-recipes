//
//  MealDetailsView.swift
//  browse-recipes
//
//  Created by Oforkanji Odekpe on 8/21/24.
//

import SwiftUI

@MainActor struct MealDetailsView: View {
    @ObservedObject private var viewModel: MealDetailsViewModel
    
    init(id: String) {
        self.viewModel = MealDetailsViewModel(id: id)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let details = viewModel.details {
                    Text("Instructions")
                        .font(.title)
                        .padding(.horizontal)
                    
                    Text(details.instruction ?? "")
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .padding([.horizontal, .bottom])
                    
                    Text("Ingredients")
                        .font(.title)
                        .padding(.horizontal)
                    
                    ingredientDetails
                        .padding(.horizontal)
                    
                    Spacer()
                } else {
                    Text("Details are empty!!!")
                }
            }
        }
        .navigationTitle(viewModel.details?.name ?? "Meal Details")
        .task {
            viewModel.fetchMealDetails()
        }
    }
    
    @ViewBuilder
    private var ingredientDetails: some View {
        if let ingredients = viewModel.details?.ingredients {
            ForEach(ingredients, id: \.ingredient) { ingredient in
                VStack(alignment: .leading) {
                    Text("Ingredient: \(ingredient.ingredient)")
                    Text("Measure: \(ingredient.measure)")
                    Divider()
                }
            }
        }
    }
}

#Preview {
    MealDetailsView(id: "53049")
}

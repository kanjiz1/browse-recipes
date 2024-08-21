//
//  MealsListView.swift
//  browse-recipes
//
//  Created by Oforkanji Odekpe on 8/19/24.
//

import SwiftUI

struct MealsListView: View {
    @State var navigationPath = NavigationPath()
    @ObservedObject private var viewModel = MealListViewModel()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(viewModel.meals) { meal in
                    NavigationLink(meal.name, value: meal)
                }
                .listRowSeparator(.hidden, edges: .all)
            }
            .listStyle(.plain)
            .navigationTitle("Desert Menu")
            .navigationDestination(for: Meals.Meal.self) { meal in
                MealDetailsView(id: meal.id)
            }
        }
        .task {
            viewModel.fetchMealList()
        }
    }
}

#Preview {
    MealsListView()
}

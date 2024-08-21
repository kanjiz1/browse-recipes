//
//  MealsService.swift
//  browse-recipes
//
//  Created by Oforkanji Odekpe on 8/21/24.
//

import Foundation

protocol MealServiceable {
    func fetchMealList() async throws -> Meals
    func fetchMealDetails(id: String) async throws -> MealDetails
}

final class MealsService: MealServiceable {
    enum NetworkError: Error {
        case invalidURL
        case invalidID
        case decodingError
        case notFound
        case badRequest
        case unauthorized
        case http(httpResponse: HTTPURLResponse, data: Data)
    }
    
    private let desertsAPI = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let mealDetailsAPI = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
// https://themealdb.com/api/json/v1/1/lookup.php?i=52928
    
    func fetchMealList() async throws -> Meals {
        guard let url = URL(string: desertsAPI) else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        do {
            let fetchedMeals = try JSONDecoder().decode(Meals.self, from: try handleResponse(response: (data,response)))
            return fetchedMeals
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func fetchMealDetails(id: String) async throws -> MealDetails {
        guard !id.isEmpty else {
            throw NetworkError.invalidID
        }
        
        let urlString = mealDetailsAPI + "\(id)"
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        do {
            let fetchedMealsDetails = try JSONDecoder().decode(MealDetails.self, from: try handleResponse(response: (data,response)))
            return fetchedMealsDetails
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    private func handleResponse(response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return response.data
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 404:
            throw NetworkError.notFound
        default:
            throw NetworkError.http(httpResponse: httpResponse, data: response.data)
        }
    }
}

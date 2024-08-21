//
//  MealServiceTests.swift
//  browse-recipesTests
//
//  Created by Oforkanji Odekpe on 8/21/24.
//

import Foundation
import XCTest
@testable import browse_recipes

final class MealServiceTests: XCTestCase {
    func testFetchMealList() async throws {
        let service = MockService()
        let data = try await service.fetchMealList()
        XCTAssertEqual(data.meals.first?.name, "Soup")
        XCTAssertEqual(data.meals.first?.id, "12345")
    }
    
    func testFetchMealDetails() async throws {
        let service = MockService()
        let data = try await service.fetchMealDetails(id: "12345")
        XCTAssertEqual(data.name, "Soup")
        XCTAssertNotNil(data.instruction)
        XCTAssertEqual(data.ingredients.count, 9)
    }
}

# browse-recipes

This app fetches meal data from 2 endpoints:
1. https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the Dessert category.
2. https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.


As the app loads:
1. The user should be shown the list of meals in the Dessert category, sorted alphabetically.
2. When the user selects a meal, they should be taken to a detail view that includes:
    - Meal name
    - Instructions
    - Ingredients/measurements
    
    
## Installation
Clone app, open with XCode and run,

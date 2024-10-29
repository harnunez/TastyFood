//
//  MealReposirotyImpl.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 24/10/2024.
//

import Foundation
import CoreData

class MealReposirotyImpl: MealRepository{
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = CoreDataStack.shared.context){
        self.context = context
    }
    
    
    func fetchMeals(category: String) throws -> [Meal] {
        var mealToView:[Meal] = []
        
        let request = MealDB.fetchRequest()
        request.predicate = NSPredicate(format: "category.idCategory == %@", category)
        
        //return try context.fetch(request)
        let listMeals = try context.fetch(request)
        if !listMeals.isEmpty{
            for mealDB in listMeals {
                var meal = Meal()
                meal.idMeal = mealDB.idMeal
                meal.strArea = mealDB.strArea
                meal.strCategory = mealDB.strCategory
                meal.strIngredient1 = mealDB.strIngredient1
                meal.strIngredient2 = mealDB.strIngredient2
                meal.strIngredient3 = mealDB.strIngredient3
                meal.strIngredient4 = mealDB.strIngredient4
                meal.strIngredient5 = mealDB.strIngredient5
                meal.strIngredient6 = mealDB.strIngredient6
                meal.strInstructions = mealDB.strInstructions
                meal.strMeal = mealDB.strMeal
                meal.strMealThumb = mealDB.strMealThumb
                meal.strMeasure1 = mealDB.strMeasure1
                meal.strMeasure2 = mealDB.strMeasure2
                meal.strMeasure3 = mealDB.strMeasure3
                meal.strMeasure4 = mealDB.strMeasure4
                meal.strMeasure5 = mealDB.strMeasure5
                meal.strMeasure6 = mealDB.strMeasure6
                
                mealToView.append(meal)
            }
            
        }
        return mealToView
        
    }
    
    func saveMeals(_ meals : [Meal] , category: String) throws {
        
        let categoryDB = CategoryDB(context: context)
        categoryDB.categoryName = category
        categoryDB.idCategory = category
        
        for mealNS in meals {
            
            //Check if Meal exist
            let request = MealDB.fetchRequest()
            request.predicate = NSPredicate(format: "idMeal == %@", mealNS.id)
                        
            let existMeal = try context.fetch(request)
            
            if existMeal.isEmpty{
                //Create meal
                let meal = MealDB(context: context)
                meal.idMeal = mealNS.idMeal
                meal.strArea = meal.strArea
                meal.strCategory = mealNS.strCategory
                meal.strIngredient1 = mealNS.strIngredient1
                meal.strIngredient2 = mealNS.strIngredient2
                meal.strIngredient3 = mealNS.strIngredient3
                meal.strIngredient4 = mealNS.strIngredient4
                meal.strIngredient5 = mealNS.strIngredient5
                meal.strIngredient6 = mealNS.strIngredient6
                meal.strInstructions = mealNS.strInstructions
                meal.strMeal = mealNS.strMeal
                meal.strMealThumb = mealNS.strMealThumb
                meal.strMeasure1 = mealNS.strMeasure1
                meal.strMeasure2 = mealNS.strMeasure2
                meal.strMeasure3 = mealNS.strMeasure3
                meal.strMeasure4 = mealNS.strMeasure4
                meal.strMeasure5 = mealNS.strMeasure5
                meal.strMeasure6 = mealNS.strMeasure6
                
                //Insert parent CategoryDB
                meal.category = categoryDB
            }
        }
        
        try CoreDataStack.shared.saveContext()
    }
    
}

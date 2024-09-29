//
//  Meal.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 18/09/2024.
//

import Foundation

struct Meal : Decodable, Identifiable{
    
    var id: String{
        return idMeal ?? UUID().uuidString  }

    var idMeal: String?
    var strMeal: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    
    var strMealThumb: String?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    
}

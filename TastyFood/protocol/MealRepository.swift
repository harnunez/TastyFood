//
//  BookRepository.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 23/10/2024.
//

import Foundation

protocol MealRepository{
    func fetchMeals(category: String) throws -> [Meal]
    func saveMeals(_ meal: [Meal], category: String)  throws    
}

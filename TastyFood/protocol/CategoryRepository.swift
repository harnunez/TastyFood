//
//  CategoryRepository.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 23/10/2024.
//

import Foundation

protocol CategoryRepository{
    func fetchCategories(category: String) throws -> [CategoryDB]
    func saveCategories(category: String) throws
}

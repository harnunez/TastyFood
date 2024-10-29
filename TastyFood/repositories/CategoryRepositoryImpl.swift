//
//  CategoryRepositoryImpl.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 24/10/2024.
//

import Foundation
import CoreData

class CategoryRepositoryImpl: CategoryRepository{
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = CoreDataStack.shared.context){
        self.context = context
    }
    
    func fetchCategories(category: String) throws -> [CategoryDB] {
        let request = CategoryDB.fetchRequest()
        request.predicate = NSPredicate(format: "idCategory == %@", category)
        
        return try context.fetch(request)
    }
    
    func saveCategories(category: String) throws {
        
        let categoryNS = Category(categoryName: category, idCategory: category)
        
        let request = CategoryDB.fetchRequest()
        request.predicate = NSPredicate(format: "idCategory == %@", category)
        
        let existCategory = try context.fetch(request)
        
        if existCategory.isEmpty{
            let categoryDB = CategoryDB(context: context)
            categoryDB.idCategory = categoryNS.idCategory
            categoryDB.categoryName = categoryNS.categoryName
        }
                    
        try CoreDataStack.shared.saveContext()
    }
    
}

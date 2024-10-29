//
//  CoreDataStack.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 23/10/2024.
//

import Foundation
import CoreData

class CoreDataStack{
    
    static let shared = CoreDataStack()
    
    lazy var persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TastyFoodDataModel")
                container.loadPersistentStores { _, error in
                    if let error = error {
                        fatalError("Failed to load Core Data stack: \(error)")
                    }
                }
                return container
        
    }()
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}

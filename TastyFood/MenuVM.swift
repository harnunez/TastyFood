//
//  MenuVM.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 20/09/2024.
//

import Foundation

class MenuVM: ObservableObject{
    
    @Published var isLoading = false
    @Published var meal: Meals?
    @Published var error: Error?
    
    private let netWorkManager: NetworkManager
    private let categoryrepository: CategoryRepository
    private let mealRepository: MealRepository
    
    init(netWorkManager: NetworkManager = NetworkManager(), mealRepository: MealRepository = MealReposirotyImpl(), categoryRepository: CategoryRepository = CategoryRepositoryImpl()) {
        
        self.netWorkManager = netWorkManager
        self.categoryrepository = categoryRepository
        self.mealRepository = mealRepository
    }
    
    @MainActor
    func fetchAllMenuByCategory(categoryChar: String) async{
        isLoading = true
        error = nil
        
        do{
            let categoryDB =  try categoryrepository.fetchCategories(category: categoryChar)
            
            if categoryDB.isEmpty{
                print("INSIDE EMPTY")
                meal = try await netWorkManager.getMenus(letter: categoryChar)
                print(meal?.meals ?? "NoneValue")
                
                if let mealNR = meal?.meals{
                    try mealRepository.saveMeals(mealNR , category: categoryChar)
                    try categoryrepository.saveCategories(category: categoryChar)
                }
                
            }else{
                print("INSIDE FULL")
                let meals = try mealRepository.fetchMeals(category: categoryChar)
                meal = Meals(meals: meals)
                
            }
                        
        }catch{
            self.error = error
        }
        
        isLoading = false
    }
    
    
    /*** Don't remove
     First method to fetch Menus by Network
     @MainActor
    func fetchMenus(charMenu: String) async{
        isLoading = true
        error = nil
        
        do{
           meal = try await netWorkManager.getMenus(letter: charMenu)
            print(meal?.meals ?? "NoneValue")
        } catch {
            self.error = error
        }
        
        isLoading = false
    }**/
    
}

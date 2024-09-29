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
    
    init(netWorkManager: NetworkManager = NetworkManager()) {
        self.netWorkManager = netWorkManager
    }
    
    
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
    }
    
    
    
    
}

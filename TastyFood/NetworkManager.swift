//
//  NetworkManager.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 20/09/2024.
//

import Foundation

class NetworkManager{
    
    func getMenus(letter: String) async throws -> Meals {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)")
        else{
            throw URLError(.badURL)
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Meals.self,from: data)
        
    }
}

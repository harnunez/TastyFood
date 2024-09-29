//
//  ContentView.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var menuVM = MenuVM()
    @State private var searchText = ""
    
    var filteredItems: [Meal] {
            if searchText.isEmpty {
                print("Emppty")
                return menuVM.meal?.meals ?? []
            } else {
                print("Loopp")
                guard let netList = menuVM.meal?.meals else {
                    return []
                }
                
                return netList.filter{
                    $0.strMeal?.lowercased().contains(searchText.lowercased()) ?? false
                }
            }
        }

    //Test Line
    var body: some View {
        VStack {
            NavigationView{
                List(filteredItems){ item in
                    MealItem(meal: item)
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                }
                .navigationTitle("Menu")
                .searchable(text:$searchText, prompt:"SearchMenu")
                .onChange(of: searchText){
                    print("Search text changed: \(searchText)")
                    Task{
                        await loadMenu(sMeal: searchText)
                    }
                }
            
            
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .task { await loadMenu() }
    }
}

extension ContentView{
    func loadMenu(sMeal: String = "a") async {
       await menuVM.fetchMenus(charMenu: sMeal)
    }
}

#Preview {
    ContentView()
}

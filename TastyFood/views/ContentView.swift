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

    
    var body: some View {
        VStack {
            NavigationView{
                List(filteredItems){ item in
                    ZStack{
                        MealItemView(meal: item)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                        
                        NavigationLink(destination: { MealDetailView(meal:item)}){EmptyView()}
                    }.listRowBackground(Color.clear)
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
       //await menuVM.fetchMenus(charMenu: sMeal)
       await menuVM.fetchAllMenuByCategory(categoryChar: sMeal)
    }
}

#Preview {
    ContentView()
}

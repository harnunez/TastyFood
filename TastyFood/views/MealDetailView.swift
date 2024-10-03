//
//  MealDetailView.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 30/09/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealDetailView: View {
    
    let meal: Meal
    
    var body: some View {
        ScrollView{
            VStack{
                Text(meal.strMeal ?? "Food").textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/).bold()
                if let image = meal.strMealThumb{
                    WebImage(url: URL(string:image))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                
                Text("Ingredients").textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/).bold()
                CustomText(customTxt: meal.strIngredient1!).frame(height: 10)
                CustomText(customTxt: meal.strIngredient2!).frame(height: 10)
                CustomText(customTxt: meal.strIngredient3!).frame(height: 10)
                CustomText(customTxt: meal.strIngredient4!).frame(height: 10)
                
                Text("Instructions").textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/).bold().padding(.top, 20)
                CustomText(customTxt: meal.strInstructions!)
            
                
            }.padding(.horizontal,20)
        }
    }
}

struct CustomText: View{
    
    let customTxt: String
    
    var body: some View {
        VStack{
            Text(customTxt).foregroundColor(.black)
                .font(.system(size: 10, weight: .light, design: .rounded))
                .bold()
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
        }
    }
}

#Preview {
    MealDetailView(meal: Meal())
}

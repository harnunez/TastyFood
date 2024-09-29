//
//  MealItem.swift
//  TastyFood
//
//  Created by Harnefer Nuñez on 18/09/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealItem: View {
    
    let meal: Meal
    
    var body: some View {
        ZStack{
            Rectangle()
        
            if let img = meal.strMealThumb {
                WebImage(url: URL(string:img))
                    .onSuccess{_,_,_ in print("Image Success")}
                    .resizable()
                    .indicator(.activity)
                    
                    
            }
            VStack{
                Spacer()
                Text(meal.strMeal ?? "Food").foregroundColor(.white)
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .bold()
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.white.opacity(0.6))
            }
            
        }.frame(height: 200).cornerRadius(30)
    }
}

#Preview {
    MealItem(meal: Meal())
    //MealItem(meal: "Chaufita")
}

//
//  FruitBrain.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 24/11/2022.
//

import Foundation

struct FruitBrain{
    
    var totalNutritrions : TotalNutritions?
    
    mutating func calculateTotalNutitions(fruits: [FruitLItem]) -> TotalNutritions{
        var totalSugar : Double = 0.0
        var totalProtein : Double = 0.0
        var totalCarbs : Double = 0.0
        var totalCal : Int = 0
        var totalFat : Double = 0.0
    
        for fruit in fruits {
            totalSugar += fruit.sugar
            totalProtein += fruit.protein
            totalCarbs += fruit.carbohydrates
            totalCal += Int(fruit.calories)
            totalFat += fruit.fat
        }
        totalNutritrions = TotalNutritions(totalSugar : totalSugar, totalProtein: totalProtein, totalCarbs:totalCarbs,totalCal:totalCal,totalFat:totalFat)
        
        return totalNutritrions!
        
    }
    
}




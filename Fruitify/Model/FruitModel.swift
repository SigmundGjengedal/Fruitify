//
//  FruitModel.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//  For å prossessere data fra api en gang

import Foundation
import UIKit

struct FruitModel {
    let genus : String
    let name : String
    let id : Int
    let family : String
    let familyColor : UIColor
    let order : String
    // for calculations
    let carbohydrates: Double
    let protein : Double
    let fat : Double
    let calories: Int
    let sugar : Double
    // for ui output
    var carbohydratesAsString : String {
        String(format: "%.1f", carbohydrates)
    }
    var proteinAsString : String {
        String(format: "%.1f", protein)
    }
    var fatAsString : String {
        String(format: "%.1f", fat)
    }
    var caloriesAsString : String {
        String(format: "%.1f", calories)
    }
    var sugarAsString : String {
        String(format: "%.1f", sugar)
    }
    var showWarning : Bool {
        if sugar <= 10 {
            return false
        } else {
            return true
        }
    }
   
}
    


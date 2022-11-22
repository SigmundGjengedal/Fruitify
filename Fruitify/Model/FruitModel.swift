//
//  FruitModel.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import Foundation

struct FruitModel {
    let genus : String
    let name : String
    let id : Int
    let family : String
    let order : String
    let carbohydrates: Double
    let protein : Double
    let fat : Double
    let calories: Int
    let sugar : Double
    
    var colorName : String {
        switch family {
        case  "Rosaceae":
            return "Rosaceae"
        default:
            return "default"

        }
    }
}
    


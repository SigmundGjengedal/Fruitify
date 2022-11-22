//
//  FruitData.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import Foundation
import UIKit

struct Fruit : Codable {
    let genus : String
    let name: String
    let id : Int
    let family:String
    let order : String
    let nutritions : Nutritions
    var color : String {
        switch family {
        case "Rosaceae":
            return ".red"
        default:
            return ".blue"

        }
    }
}
    

struct Nutritions : Codable {
    let carbohydrates : Double
    let protein : Double
    let fat : Double
    let calories : Int
    let sugar : Double
}


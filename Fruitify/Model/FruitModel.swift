//
//  FruitModel.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//  Sparer kode ved å gjøre alle nødvendige operasjoner her? Slipper kalle de manuelt, skjer automatisk.

import Foundation
import UIKit

struct FruitModel {
    let genus : String
    let name : String
    let id : Int
    let family : String
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
        if sugar < 10 {
            return false
        } else {
            return true
        }
    }
    var colorName : UIColor {
        switch family {
        case  "Rosaceae":
            return .red
        case  "Lauraceae":
            return .green
        case  "Musaceae":
            return .blue
        case  "Cactaceae":
            return .yellow
        case  "Malvaceae":
            return .purple
        case  "Moraceae":
            return .orange
        case  "Grossulariaceae":
            return .black
        case  "Actinidiaceae":
            return .brown
        case "Rutaceae":
            return .cyan
        case "Ericaceae":
            return .lightGray
        case "Sapindaceae" :
            return .systemTeal
        case "Anacardiaceae" :
            return .systemGray6
        case "Cucurbitaceae":
            return .systemGray4
        case "Caricaceae":
            return .systemIndigo
        case  "Vitaceae":
            return .systemMint
        case  "Myrtaceae":
            return .systemPink
        case "Passifloraceae":
            return .systemPurple
        case "Ebenaceae":
            return .systemBlue
        case "Bromeliaceae":
            return .systemGray2
        case "Lythraceae":
            return .systemGray3
        case "Solanaceae" :
            return .secondaryLabel
        default:
            return .white

        }
    }
}
    


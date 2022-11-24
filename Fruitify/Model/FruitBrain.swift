//
//  FruitBrain.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 24/11/2022.
//

import Foundation
// bør kanskje flytte all funksjonalitet på beregning hit? Se BMI calBrain

struct fruitBrain{
    var fruit : FruitModel?
    
  // kanskje ha color her? Usikker om det blir mere kode,  for da må man kalle på de hver gang?
    
    
    // ikke brukt  - numbers for bruk i ui Output
    func getDoubleAsString(value : Double?) -> String{
        return String(format: "%.1f", value ?? 0.0)
    }
}




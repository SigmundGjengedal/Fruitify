//
//  FruitManager.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import Foundation
import UIKit

struct FruitManager {
        
    static var globalFruits = [FruitModel]()
    
    func fetchAllFruits(urlString : String,completion: @escaping (Result<[FruitModel], Error>) -> Void){
        let url = URL(string : urlString)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            if let gotData = data {
                if let parsingData = parseJSON(gotData){
                    completion(.success(parsingData) )
                }
            }
        }
        dataTask.resume()
    }
    
    func parseJSON(_ fruitData: Data)-> [FruitModel]?{
        do{
            let parsingData = try JSONDecoder().decode([Fruit].self, from: fruitData)
            var processedFruit  : [FruitModel] = []
            
            // dict av unike colors per familie
            var familySet = Set<String>()
            for fruit in parsingData{
                familySet.insert(fruit.family)
            }
            var colordict1 = [String:UIColor]()
            for family in familySet{
                colordict1[family] = .random
            }
            // bygger struct med computed props (FruitModel)
            for fruit in parsingData{
                let genus = fruit.genus
                let name = fruit.name
                let id = fruit.id
                let family = fruit.family
                let order = fruit.order
                // nutr
                let carbohydrates = fruit.nutritions.carbohydrates
                let protein =  fruit.nutritions.protein
                let fat =  fruit.nutritions.fat
                let calories  = fruit.nutritions.calories
                let sugar = fruit.nutritions.sugar
                let familyColor = colordict1[fruit.family] ?? .white
                let fruitM = FruitModel(genus: genus ,name: name, id: id, family: family, familyColor: familyColor, order: order,carbohydrates: carbohydrates,protein: protein,fat:fat,calories: calories,sugar: sugar)
                processedFruit.append(fruitM)
            }
             FruitManager.globalFruits = processedFruit.sorted { $0.id < $1.id }
             return processedFruit.sorted { $0.id < $1.id }
        } catch{
            print(error)
            return nil
        }
    
    }
    
}

extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation:  1, brightness: .random(in: 0.6...1), alpha: 1)
    }
}

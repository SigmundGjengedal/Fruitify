//
//  FruitManager.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import Foundation


struct FruitManager {
    
   // "https://www.fruityvice.com/api/fruit/all"
   // https://www.fruityvice.com/api/fruit/family/:family , https://www.fruityvice.com/api/fruit/family/Rosaceae
    // https://www.fruityvice.com/api/fruit/genus/:genus , https://www.fruityvice.com/api/fruit/genus/rubus
    //https://www.fruityvice.com/api/fruit/order/:order, https://www.fruityvice.com/api/fruit/order/Solanales
    
    static var globalFruits = [FruitModel]()
    
    
    func fetchAllFruits(urlString : String,completion: @escaping ([FruitModel]) -> Void){
        let url = URL(string : urlString)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error != nil {
                print(error!)
                return
            }
            if let gotData = data {
                if let parsingData = parseJSON(gotData){
                    completion(parsingData)
                }
            }
        }
        dataTask.resume()
    }
    
    func parseJSON(_ fruitData: Data)-> [FruitModel]?{
        do{
            let parsingData = try JSONDecoder().decode([Fruit].self, from: fruitData)
            var processedFruit  : [FruitModel] = []
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
                let fruitM = FruitModel(genus: genus ,name: name, id: id, family: family, order: order,carbohydrates: carbohydrates,protein: protein,fat:fat,calories: calories,sugar: sugar)
                processedFruit.append(fruitM)
            }
             FruitManager.globalFruits = processedFruit.sorted { $0.id < $1.id }
             return processedFruit.sorted { $0.id < $1.id }
        } catch{
            print(error)
            return nil
        }
    
    }
    // test


    
}

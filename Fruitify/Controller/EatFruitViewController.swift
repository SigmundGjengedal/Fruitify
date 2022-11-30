//
//  EatFruitViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 26/11/2022.
//

import UIKit
import CoreData

class EatFruitViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var fruit : FruitModel?
    var date : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func logbtnPressed(_ sender: UIButton) {
        // back to root (List all fruits)
     self.navigationController?.popToRootViewController(animated: true)
        if let safeDate = date {
            print(safeDate)
        }
      
        createItem()
      
    }
    
    @IBAction func canceelBtnPressed(_ sender: UIButton) {
        // tilbake til detail
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        self.date = sender.date
    
    }
}

extension EatFruitViewController {
    
    func createItem(){
        
        if let hasFruit = fruit {
            let newDbItem = FruitLItem(context: context)
            newDbItem.name = hasFruit.name
            newDbItem.date = date
            newDbItem.calories = Int32(hasFruit.calories)
            newDbItem.carbohydrates = hasFruit.carbohydrates
            newDbItem.fat = hasFruit.fat
            newDbItem.protein = hasFruit.protein
            newDbItem.sugar = hasFruit.sugar
        }
        
        do {
          try context.save()
        }
        catch {
            print(error)
        }
    }
}

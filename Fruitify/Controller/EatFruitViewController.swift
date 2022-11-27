//
//  EatFruitViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 26/11/2022.
//

import UIKit

class EatFruitViewController: UIViewController {
    
    var fruit : FruitModel?
    var date : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // bare debug
    }
    

    @IBAction func logbtnPressed(_ sender: UIButton) {
        // back to root (List all fruits)
     self.navigationController?.popToRootViewController(animated: true)
        if let safeDate = date {
            print(safeDate)
        }
        print(fruit!)
        print(date!)
      
    }
    
    @IBAction func canceelBtnPressed(_ sender: UIButton) {
        // back to detail
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        self.date = sender.date
    
    }
}

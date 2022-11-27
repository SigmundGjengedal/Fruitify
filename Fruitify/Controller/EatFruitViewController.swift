//
//  EatFruitViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 26/11/2022.
//

import UIKit

class EatFruitViewController: UIViewController {
    
    var fruit : FruitModel?
    var date : String?
    var weekDay : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // bare debug
        print(date!)
    }
    

    @IBAction func logbtnPressed(_ sender: UIButton) {
        // back to root (List all fruits)
    // self.navigationController?.popToRootViewController(animated: true)
        if let safeDate = date {
            print(safeDate)
        }
        
        print(weekDay!)
      
    }
    
    @IBAction func canceelBtnPressed(_ sender: UIButton) {
        // back to detail
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.date = dateFormatter.string(from: selectedDate)
       // let weekday = Calendar.current.component(.weekday, from:selectedDate)
     
        weekDay = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: selectedDate ) - 1]
        
    
    }
}

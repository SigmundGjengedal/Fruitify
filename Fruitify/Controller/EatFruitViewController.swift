//
//  EatFruitViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 26/11/2022.
//

import UIKit

class EatFruitViewController: UIViewController {
    
    var fruit : FruitModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // bare debug
        print(fruit!)
    }
    

    @IBAction func logbtnPressed(_ sender: UIButton) {
        // back to root (List all fruits)
     self.navigationController?.popToRootViewController(animated: true)
      
    }
    
    @IBAction func canceelBtnPressed(_ sender: UIButton) {
        // back to detail
        self.navigationController?.popViewController(animated: true)
    }
}

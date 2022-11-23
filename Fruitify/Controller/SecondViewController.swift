//
//  SecondViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 23/11/2022.
//

import UIKit

class SecondViewController: UIViewController {
    var fruit : FruitModel?
    
    @IBOutlet weak var familyLabel: UILabel!
 
    @IBOutlet weak var familyLabelValue: UILabel!
    
    @IBOutlet weak var OrderLabel: UILabel!
    @IBOutlet weak var orderLabelValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = fruit?.name
       familyLabel.text = "family"
       familyLabelValue.text = fruit?.family
        OrderLabel.text = "order"
        orderLabelValue.text =  fruit?.order
        
       
        
        // Do any additional setup after loading the view.
    }
    
}

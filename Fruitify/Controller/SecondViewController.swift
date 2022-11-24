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
    
    
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var genusLabelValue: UILabel!
    
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var carbsLabelValue: UILabel!
    
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var proteinLabelValue: UILabel!
    
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var fatLabelValue: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var caloriesLabelValue: UILabel!
    
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var sugarLabelValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = fruit?.name
       
        familyLabel.text = "family"
        familyLabelValue.text = fruit?.family
        
        OrderLabel.text = "order"
        orderLabelValue.text =  fruit?.order
        
        genusLabel.text = "Genus"
        genusLabelValue.text =  fruit?.genus
        
        carbsLabel.text = "Carbs"
        carbsLabelValue.text = fruit?.carbohydratesAsString
        
        proteinLabel.text = "Protein"
        proteinLabelValue.text = fruit?.proteinAsString
        
        fatLabel.text = "Fat"
        fatLabelValue.text = fruit?.fatAsString
        
        caloriesLabel.text = "Calories"
        caloriesLabelValue.text = fruit?.caloriesAsString
        
        sugarLabel.text = "Sugar"
        sugarLabelValue.text = fruit?.sugarAsString
        
        
        // mulig jeg endrer ui.
       
    }
    
}

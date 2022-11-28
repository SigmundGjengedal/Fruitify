//
//  SecondViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 23/11/2022.
//

import UIKit

class FruitsDetailsController: UIViewController {
    var fruit : FruitModel?
    
    @IBOutlet weak var detailsContainerView: UIView!
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
    
    @IBOutlet weak var sugarWarningLabel: UILabel!
    
    
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
        
        if let hasWarning = fruit?.showWarning{
            if(hasWarning){
                sugarWarningLabel.text = "High sugar"
                sugarWarningLabel.backgroundColor = .red
                getRandomColor()
            }else {
                sugarWarningLabel.text = "Low sugar"
                sugarWarningLabel.backgroundColor = .green
                
            }
        }
        
        // endrer ui om tid.
       
    }// end of didLoad
    
    // ref kilde
    func getRandomColor() {
        let red   = CGFloat((arc4random() % 256)) / 255.0
        let alpha = CGFloat(1.0)

        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
            self.view.backgroundColor = UIColor(red: red, green: 0, blue: 0, alpha: alpha)
            self.detailsContainerView.backgroundColor = UIColor(red: red, green: 0, blue: 0, alpha: alpha)
            
        }, completion:nil)
    }
    
    
    @IBAction func eatPressed(_ sender: UIButton) {
        if let eatVC = storyboard?.instantiateViewController(withIdentifier: "EatFruitViewController") as? EatFruitViewController{
            let date = Date()
            // setter data
            eatVC.fruit = fruit
            eatVC.date = date
            // navigerer
            self.navigationController?.pushViewController(eatVC, animated: true)
    }
    
}
}

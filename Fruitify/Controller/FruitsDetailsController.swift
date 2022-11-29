//
//  SecondViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 23/11/2022.
//

import UIKit

class FruitsDetailsController: UIViewController {
    var fruit : FruitModel?
    var fruitData = [FruitModel]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
                animateBackground()
            }else {
                sugarWarningLabel.text = "Low sugar"
                sugarWarningLabel.backgroundColor = .green
                
            }
        }
        
        // animations kall
        
        if let fruit = fruit {
            let numFruits =  getNumEatenFruitThisMonth()
            if(numFruits>0){
                let fruitEmojis : [String:String] = ["Apple" : "🍎", "Orange": "🍊",  "Lemon" :"🍋","Blueberry":"🫐","Cherry":"🍒","Pineapple" : "🍍", "Kiwi":"🥝", "Grapes":"🍇", "Banana":"🍌"]
                let emoji = fruitEmojis[fruit.name] ?? "💯"
                rainEatenFruits(with: emoji, count: numFruits)
                }
        }
        // endrer ui om tid.
       
    }// end of didLoad
    
    func animateBackground() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.view.backgroundColor = .red
            self.detailsContainerView.backgroundColor = .red
            
        }, completion:nil)
    }
    
    // flyttes til Fruitbrain?
    func rainEatenFruits(with emoji: String, count : Int) {
     
        for _ in 0..<count {
            let randomXPosition = Int.random(in: 100..<Int(view.frame.width)-100)
            let randomYPosition = Int.random(in: -40...0)
            let fruitLabel = UILabel()
            fruitLabel.text = emoji
            fruitLabel.frame = CGRect(x: randomXPosition, y: randomYPosition, width:50 , height: 50)
            fruitLabel.font = fruitLabel.font.withSize(40)
            view.addSubview(fruitLabel)
            
            UIView.animate(withDuration: 3.0, delay: 0.0, options:[.allowUserInteraction], animations: {
                fruitLabel.frame = CGRect(x: randomXPosition, y: 1000, width: 50, height: 50)
                fruitLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                
            }, completion:nil)
        }
    }
    
    // CRUD FLYTTES TIL DBSERVICE?
    func getNumEatenFruitThisMonth() -> Int{
        do{
            var dbFruits = [FruitLItem]()
            dbFruits = try context.fetch(FruitLItem.fetchRequest())
            var matchedFruits = [FruitLItem]()
            let oneMonthAgo = Date(timeIntervalSinceNow: -30 * 60 * 60 * 24)
            matchedFruits = dbFruits.filter {$0.date! > oneMonthAgo}
            return matchedFruits.filter {$0.name == fruit?.name}.count
        }
        catch {
        print(error)
        }
        return 0
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

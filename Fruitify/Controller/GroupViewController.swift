//
//  GroupViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 25/11/2022.
//

import UIKit

class GroupViewController: UIViewController {
 
    
   var fruitData = [FruitModel]()
   var fruitManager = FruitManager()
   var urlString = "https://www.fruityvice.com/api/fruit/genus/rubus"
    
    
    
    @IBAction func testButton(_ sender: UIButton) {
        print("fhjdksa")
        // pushing navigation
        if let secondVc = storyboard?.instantiateViewController(withIdentifier: "AllFruitsController") as? AllFruitsViewController{
            // setter data
            secondVc.fruitData = fruitData
            secondVc.genus = "rubus"
            secondVc.urlString = "https://www.fruityvice.com/api/fruit/genus/rubus"
            // navigerer
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(fruitData)
        // Do any additional setup after loading the view.
         
         fruitManager.fetchAllFruits(urlString: urlString) { result in
             // print(result)
             self.fruitData = result
             print(self.fruitData)
         }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
    }
    */

}

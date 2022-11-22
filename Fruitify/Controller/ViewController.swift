//
//  ViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // GH test
    
    var fruitData = [FruitModel]()

    @IBOutlet weak var tableView: UITableView!
    
    var fruitManager = FruitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fruitManager.fetchAllFruits() { result in
            // print(result)
            self.fruitData = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


}
 
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        let test = "\(fruitData[indexPath.row].colorName) \(fruitData[indexPath.row].family)"
    
        cell.fruitName.text = fruitData[indexPath.row].family
        cell.familyImage.backgroundColor = fruitData[indexPath.row].colorName
        
        return cell
    }
}

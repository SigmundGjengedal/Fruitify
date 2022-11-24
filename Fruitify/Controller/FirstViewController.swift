//
//  ViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import UIKit

class FirstViewController: UIViewController {
        
    var fruitData = [FruitModel]()

    @IBOutlet weak var tableView: UITableView!
    
    var fruitManager = FruitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fruitManager.fetchAllFruits(urlString: "https://www.fruityvice.com/api/fruit/all") { result in
            // print(result)
            self.fruitData = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


}

//for interaksjon med bruker
extension FirstViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // pushing navigation
        if let secondVc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            // setter data
            secondVc.fruit = fruitData[indexPath.row]
            // navigerer
            self.navigationController?.pushViewController(secondVc, animated: true)
        }        
    }
}

 
extension FirstViewController : UITableViewDataSource {
    
    // hvor mange celler den trenger
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitData.count
    }
    
    // hva  vi  skal  putte i hver  celle
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // allokerer minne ved å gjennbruke celler.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let nameAndId = "\(fruitData[indexPath.row].name)  id: \(fruitData[indexPath.row].id)   "
        
        // props i MyTableViewCell
        cell.fruitName.text = nameAndId
        cell.familyImage.backgroundColor = fruitData[indexPath.row].colorName
        
        return cell
    }
}


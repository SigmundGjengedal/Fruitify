//
//  ViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import UIKit

class ListFruitsViewController: UIViewController {
    
    // static let fruitData
        
    var fruitData = [FruitModel]()
    var urlString : String?
    var selectedFilter : String?
    var searchValue : String?
    
    func setUrlString(){
        if(selectedFilter == nil && searchValue == nil){
          urlString = "https://www.fruityvice.com/api/fruit/all"
        }else {
            urlString = "https://www.fruityvice.com/api/fruit/\(selectedFilter!)/\(searchValue!)"
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    var fruitManager = FruitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUrlString()
        fruitManager.fetchAllFruits(urlString: urlString!) { result in
            // print(result)
            self.fruitData = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // prøve å få med data ved trykk på group
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let groupController = segue.destination  as? GroupViewController {
            groupController.fruitData = fruitData
        }
    }


}

//for interaksjon med bruker
extension ListFruitsViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // pushing navigation
        if let secondVc = storyboard?.instantiateViewController(withIdentifier: "FruitsDetailsController") as? FruitsDetailsController{
            // setter data
            secondVc.fruit = fruitData[indexPath.row]
            // navigerer
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
    }
}



 
extension ListFruitsViewController : UITableViewDataSource {
    
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


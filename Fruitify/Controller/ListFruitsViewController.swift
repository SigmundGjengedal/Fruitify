//
//  ViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import UIKit

class ListFruitsViewController: UIViewController {
        
    var fruitData = [FruitModel]()
    var urlString : String?
    var selectedFilter : String?
    var searchValue : String?

    @IBOutlet weak var tableView: UITableView!
    
    var fruitManager = FruitManager()
    
    override func viewWillAppear(_ animated: Bool) {
        if FruitManager.globalFruits.isEmpty {
            fetchApiData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Fruits"
        setUrlString()
        fetchApiData()
    }
    
    // metoder
    func setUrlString(){
        if(selectedFilter == nil && searchValue == nil){
          urlString = "https://www.fruityvice.com/api/fruit/all/"
        }else {
            urlString = "https://www.fruityvice.com/api/fruit/\(selectedFilter!)/\(searchValue!)"
        }
    }
    
    func fetchApiData(){
        fruitManager.fetchAllFruits(urlString: urlString!) {
            result in
                switch result {
                    
                case .failure(let error):
                    let alertCtr = AlertController(title: "Feilmelding", message: error.localizedDescription)
                    DispatchQueue.main.async {
                        self.present(alertCtr.displayAlert(),animated: true, completion: nil)
                    }
                
                case .success(let result):
                    if let res = result.1 as? HTTPURLResponse{
                        if res.statusCode != 200 {
                            let alertCtr = AlertController(title: "Feilmelding", message:"feil på server,fikk ingen data")
                            DispatchQueue.main.async {
                                self.present(alertCtr.displayAlert(),animated: true, completion: nil)
                            }
                        } else{
                            self.fruitData = result.0!
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
              
                }
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

// populere
extension ListFruitsViewController : UITableViewDataSource {
    
    // hvor mange celler den trenger
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitData.count
    }
    
    // hva  vi  skal  putte i hver  celle
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // allokerer minne ved å gjennbruke celler.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let name = "\(fruitData[indexPath.row].name)"
        
        // props i MyTableViewCell
        cell.fruitName.text = name
        cell.familyImage.backgroundColor = fruitData[indexPath.row].familyColor
        
        return cell
    }
}


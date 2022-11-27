//
//  LogViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 25/11/2022.
//

import UIKit

class LogViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    // UITableViewDelegate,UITableViewDataSource
    
    // dit vi går for å hente objekt
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var logTableView: UITableView!
    
    private var fruits = [FruitLItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllFruits()
        print(fruits[0].name!)
    
        logTableView.delegate = self
        logTableView.dataSource = self
  
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath)
        
        let currentFruit = fruits[indexPath.row]
        
        cell.textLabel?.text = currentFruit.name
    
        return cell
    }
    
    
    
    // CRUD
    func getAllFruits(){
        do{
            fruits = try context.fetch(FruitLItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.logTableView.reloadData()
            }
        }
        catch {
        // errror
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

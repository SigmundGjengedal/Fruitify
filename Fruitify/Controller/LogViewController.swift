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
    let dateFormatter = DateFormatter()
    
    private var fruits = [FruitLItem]()
    var dateSet : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllFruits()
        logTableView.delegate = self
        logTableView.dataSource = self
        print(dateSet)
        dateFormatter.dateFormat = "dd/MM/yyyy"
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var fruitsCount = 0
        
        for fruit in fruits  {
            let stringDate = dateFormatter.string(from: fruit.date!)
            if(stringDate == dateSet[section]){
                fruitsCount+=1
            }
        }
        return fruitsCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dateSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath)
        
        var fruitsOnDate = [FruitLItem]()
        for fruit in fruits {
            let stringDate = dateFormatter.string(from: fruit.date!)
            if(stringDate == dateSet[indexPath.section]){
                fruitsOnDate.append(fruit)
            }
        }
        cell.textLabel?.text = fruitsOnDate[indexPath.row].name
        return cell
    }
    
 
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dateSet[section]
    }
    
    
    
    
    // CRUD
    func getAllFruits(){
        do{
            
            var dbFruits = [FruitLItem]()
            dbFruits = try context.fetch(FruitLItem.fetchRequest())
            fruits = dbFruits.sorted(by: {$0.date! < $1.date!})
            
            // bygger unikt set med datoer for section .count
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            for fruit in fruits {
               let stringDate = dateFormatter.string(from: fruit.date!)
                if(!dateSet.contains(stringDate)){
                    dateSet.append(stringDate)
                }
            }
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

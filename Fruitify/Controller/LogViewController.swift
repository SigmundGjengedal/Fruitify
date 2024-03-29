//
//  LogViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 25/11/2022.
//

import UIKit


class LogViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    var fruitBrain = FruitBrain()
    
    // dit vi går for å hente objekt
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var logTableView: UITableView!
    let dateFormatter = DateFormatter()
    private var fruits = [FruitLItem]()
    var dateSet : [String] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllFruits()
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let myFooterNib = UINib(nibName: "LogFooterView", bundle: nil)
        logTableView.register(myFooterNib, forHeaderFooterViewReuseIdentifier: "LogFooterView")
        logTableView.delegate = self
        logTableView.dataSource = self
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
        // looper gjennom alle dbfruits, og sjekker om hver enkelt dato er lik dato for index av nåverende section(en section per dato).
        for fruit in fruits {
            let stringDbDate = dateFormatter.string(from: fruit.date!)
            if(stringDbDate == dateSet[indexPath.section]){
                fruitsOnDate.append(fruit)
            }
        }
        cell.textLabel?.text = fruitsOnDate[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = dateFormatter.date(from: dateSet[section])
        let weekDay = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: date!) - 1]
        return "\(weekDay) \(dateSet[section])"
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LogFooterView") as! LogFooterView
        
        var fruitsOnDate = [FruitLItem]()
        for fruit in fruits {
            let stringDbDate = dateFormatter.string(from: fruit.date!)
            if(stringDbDate == dateSet[section]){
                fruitsOnDate.append(fruit)
            }
        }
        
       let totals = fruitBrain.calculateTotalNutitions(fruits: fruitsOnDate)
        
        footer.sugarLabelValue.text = "sukker: \(String(format: "%.2f", totals.totalSugar))"
        footer.proteinLabelValue.text = "protein: \(String(format: "%.2f", totals.totalProtein))"
        footer.totalCarbsLabel.text = "Karbohydrater: \(String(format: "%.2f", totals.totalCarbs))"
        footer.totalCalVallueLabel.text = "Kalorier: \(totals.totalCal)"
        footer.totalFatValueLabel.text = "Fett: \(String(format: "%.2f", totals.totalFat))"
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // DB
    func getAllFruits(){
        do{
            var dbFruits = [FruitLItem]()
            dbFruits = try context.fetch(FruitLItem.fetchRequest())
            if(dbFruits.isEmpty){
                let alertCtr = AlertController(title: "Feilmelding", message: "Vi fant ingen data i loggen din")
                DispatchQueue.main.async {
                    self.present(alertCtr.displayAlert(),animated: true, completion: nil)
                }
            }
            fruits = dbFruits.sorted(by: {$0.date! < $1.date!})
            // bygger unikt set med datoer for sortering i tableview
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            for fruit in fruits {
               // print("\(fruit.name!) \(fruit.date!)")
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
            print(error)
        }
    }
    

}

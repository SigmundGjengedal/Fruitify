//
//  ViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 22/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var fruitData = [Fruit]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchAllFruits(URL: "https://www.fruityvice.com/api/fruit/all") { result in
            print(result)
            self.fruitData = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func fetchAllFruits(URL url : String, completion: @escaping ([Fruit]) -> Void){
        let url = URL(string : url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do{
                    let parsingData = try JSONDecoder().decode([Fruit].self, from: data!)
                    completion(parsingData)
                } catch {
                    print("parsing error")
                }
            }
        }
        dataTask.resume()
    }
}
 
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    
        cell?.textLabel?.text = fruitData[indexPath.row].name
        return cell!
    }
}

//
//  GroupViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 25/11/2022.
//

import UIKit

class GroupViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
   var fruitData = [FruitModel]()
   var fruitManager = FruitManager()
   // fetcher all data for å bruke den i collectionViewController.
   var urlString = "https://www.fruityvice.com/api/fruit/all"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // som flexbox
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
         
         fruitManager.fetchAllFruits(urlString: urlString) { result in
             // print(result)
             self.fruitData = result
             print(self.fruitData)
         }
    }
    
}

// interakjson med cella
extension GroupViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath.section)
        let cell : MyCollectionViewCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        
        print(cell.cellLabel!.text!)
        
        // setter opp destinasjon ved klikk:
        if let secondVc = storyboard?.instantiateViewController(withIdentifier: "AllFruitsController") as? ListFruitsViewController{
            
            // trenger jeg denne da?!?!
            secondVc.fruitData = fruitData
            // setter filter for fam/order/genus
            switch indexPath.section {
            case 0:
                secondVc.selectedFilter = "family"
            case 1:
                secondVc.selectedFilter = "order"
            case 2:
            secondVc.selectedFilter = "genus"
            default:
                secondVc.selectedFilter = "all"
            }
            // setter filter for
            secondVc.searchValue = cell.cellLabel!.text!
            // navigerer
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
        
    }
}

// populerer viewet
extension GroupViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // sjekk på section og return count. Må ha data.
       /* if section == 0 {
            return jfdklas.count
        }*/
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        // her må riktig data
        if(indexPath.section ==  0  ){
            cell.cellLabel.text = "Lauraceae"
        }
        if(indexPath.section ==  1  ){
            cell.cellLabel.text = "Laurales"
        }
        if(indexPath.section ==  2  ){
            cell.cellLabel.text = "Persea"
        }
        
        return cell
    }
    
    
    // setter antall sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
}

// custom design
extension GroupViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}


// denne skal være på noe ala didSelectRowAt på tableView, men på collectionview
/*
@IBAction func testButton(_ sender: UIButton) {
    print("fhjdksa")
    // pushing navigation
    if let secondVc = storyboard?.instantiateViewController(withIdentifier: "AllFruitsController") as? ListFruitsViewController{
        // setter data
        secondVc.fruitData = fruitData
        // disse verdiene må komme ved  trykk på ting i UI
        secondVc.selectedFilter = "genus"
        secondVc.searchValue = "rubus"
        // navigerer
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
}*/

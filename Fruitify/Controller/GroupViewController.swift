//
//  GroupViewController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 25/11/2022.
//

import UIKit

class GroupViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // 1: var fruitData = [FruitModel]()
   var fruitManager = FruitManager()
   // fetcher all data for å bruke den i collectionViewController.
   var urlString = "https://www.fruityvice.com/api/fruit/all"
    
    
    var familyArray : [String] = []
    var genusArray : [String] = []
    var orderArray : [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // som flexbox
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.collectionViewLayout = layout
        
        // henter custom layouts
        // celle
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: "MyCollectionViewCell")
        // header
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
    
        // tar på delegate ansvar
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // bygger unike set for sortering
        var familySet = Set<String>()
        for fruit in FruitManager.globalFruits {
            familySet.insert(fruit.family)
        }
        familyArray = Array(familySet)
      
        var genusSet = Set<String>()
        for fruit in FruitManager.globalFruits {
            genusSet.insert(fruit.genus)
        }
        genusArray = Array(genusSet)
        
        
        var orderSet = Set<String>()
        for fruit in FruitManager.globalFruits {
            orderSet.insert(fruit.order)
        }
        orderArray = Array(orderSet)
        
        // fetch før global var
        /* 1: fruitManager.fetchAllFruits(urlString: urlString) { result in
             // print(result)
             self.fruitData = result
         
         }*/

   
    }
    
}

// interakjson med cella
extension GroupViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath.section)
        let cell : MyCollectionViewCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        
        // setter opp destinasjon ved klikk:
        if let secondVc = storyboard?.instantiateViewController(withIdentifier: "AllFruitsController") as? ListFruitsViewController{
            
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
        if section == 0 {
            return familyArray.count
        }
        if section == 1 {
                return orderArray.count
            }
        return genusArray.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.cellLabel.layer.masksToBounds = true
        cell.cellLabel.layer.cornerRadius = 5
        cell.cellLabel.layer.borderWidth = 1
      
        // her må riktig data
        if(indexPath.section ==  0  ){
            cell.cellLabel.text = familyArray[indexPath.row]
        }
        if(indexPath.section ==  1  ){
            cell.cellLabel.text = orderArray[indexPath.row]
        }
        if(indexPath.section ==  2  ){
            cell.cellLabel.text = genusArray[indexPath.row]
        }
        
        return cell
    }
    
    
    // setter antall sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    // header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.configure()
        
        if(indexPath.section ==  0  ){
            header.label.text = "Sorted By Family"
        }
        if(indexPath.section ==  1  ){
            header.label.text = "Sorted By Order"
        }
        if(indexPath.section ==  2  ){
            header.label.text = "Sorted By Genus"
        }
        
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
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

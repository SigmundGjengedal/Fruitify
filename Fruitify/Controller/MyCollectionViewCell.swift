//
//  MyCollectionViewCell.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 25/11/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    // tag?
    @IBOutlet var cellLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /*public func configure(with label: UILabel){
        cellLabel = label
    }*/
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
}

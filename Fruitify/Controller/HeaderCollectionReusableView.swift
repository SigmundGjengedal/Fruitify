//
//  HeaderCollectionReusableView.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 26/11/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
       let label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.textColor = .white
        label.font = label.font.withSize(24)
        return label
    }()
    
    
    public func configure(){
        backgroundColor = .systemMint
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
        
}

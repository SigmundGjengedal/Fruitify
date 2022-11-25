//
//  TabBarController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 25/11/2022.
//

import Foundation
import UIKit

class TabBarController : UITabBarController {
    
    var fruitData = [FruitModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let viewControllers = viewControllers else {
            return
        }
        
       let groupViewC = UINavigationController(rootViewController: GroupViewController())
        
       tabBarController?.setViewControllers([groupViewC], animated: true)
        
        
        for viewController in viewControllers {
            if let mainNavigationController = viewController as? MainNavigationController {
                if let groupViewController = mainNavigationController.viewControllers.first as? GroupViewController {
                    groupViewController.fruitData = fruitData
                }
            }
        }
    }
    
    
}

//
//  alertController.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 29/11/2022.
//

import Foundation
import UIKit

class AlertController {
    let message : String?
    let title : String?
    
    init(title:String, message:String)  {
         self.message = message
         self.title = title
     }
    
    func displayAlert() -> UIAlertController {
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

          alert.addAction(UIAlertAction(title: "Lukk", style: UIAlertAction.Style.default, handler: { _ in
             // evt action her
          }))
        return alert
      }
}

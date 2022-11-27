//
//  FruitLItem+CoreDataProperties.swift
//  Fruitify
//
//  Created by Sigmund Andre Gjengedal on 27/11/2022.
//
//

import Foundation
import CoreData


extension FruitLItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FruitLItem> {
        return NSFetchRequest<FruitLItem>(entityName: "FruitLItem")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var carbohydrates: Double
    @NSManaged public var protein: Double
    @NSManaged public var fat: Double
    @NSManaged public var calories: Int32
    @NSManaged public var sugar: Double

}

extension FruitLItem : Identifiable {

}

//
//  Ingredient+CoreDataProperties.swift
//  Recipes
//
//  Created by Gary Kagan on 6/28/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

import Foundation
import CoreData

extension Ingredient {

    @NSManaged var quantity: NSNumber?
    @NSManaged var name: String?
    @NSManaged var unit: Unit?
    @NSManaged var recipe: Recipe?

}

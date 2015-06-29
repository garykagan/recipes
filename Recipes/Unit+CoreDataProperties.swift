//
//  Unit+CoreDataProperties.swift
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

extension Unit {

    @NSManaged var ratio: NSNumber?
    @NSManaged var name: String?
    @NSManaged var parent: Unit?
    @NSManaged var children: NSSet?
    @NSManaged var ingredients: NSSet?

}

//
//  RecipeListDataSource.swift
//  Recipes
//
//  Created by Gary Kagan on 6/27/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//

import UIKit

class RecipeListDataSource: NSObject, UITableViewDataSource {

    // MARK: - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeRowCell", forIndexPath: indexPath)
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        
    }
}

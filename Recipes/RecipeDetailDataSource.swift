//
//  RecipeDetailDataSource.swift
//  Recipes
//
//  Created by Gary Kagan on 6/27/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//

import UIKit

class RecipeDetailDataSource: NSObject, UITableViewDataSource {
    // MARK: - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 1
        
        if section == 2{
            rowCount = 5
        } else if section == 3 {
            rowCount = 20
        }
        
        return rowCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier: String?
        if indexPath.section == 0 {
            cellIdentifier = "RecipeImageCell"
        } else if indexPath.section == 1 {
            cellIdentifier = "RecipeDescriptionCell"
        } else if indexPath.section == 2 {
            cellIdentifier = "RecipeIngredientItemCell"
        } else if indexPath.section == 3 {
            cellIdentifier = "RecipeStepCell"
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier!, forIndexPath: indexPath)
        
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            self.configureDescriptionCell(cell as! RecipeDescriptionTableViewCell, atIndexPath: indexPath)
        }
    }
    
    func configureDescriptionCell(cell: RecipeDescriptionTableViewCell, atIndexPath indexPath: NSIndexPath) {
        cell.content.text = "The quick brown fox jumped over the lazy dog.  The quick brown fox jumped over the lazy dog.  The quick brown fox jumped over the lazy dog.  The quick brown fox jumped over the lazy dog.  The quick brown fox jumped over the lazy dog."
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 2 {
            return true
        }
        
        return false
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String? = nil
        if section == 2 {
            title = "Ingredients"
        } else if section == 3 {
            title = "Procedure"
        }
        return title
    }
}

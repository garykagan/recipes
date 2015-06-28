//
//  RecipeListViewController.swift
//  Recipes
//
//  Created by Gary Kagan on 6/27/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recipes"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shopping", style: UIBarButtonItemStyle.Plain, target: self, action: "shopping")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shopping() {
        self.navigationController?.performSegueWithIdentifier("ShowShoppingListSegue", sender: self)
    }
    
    // MARK: Table View Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

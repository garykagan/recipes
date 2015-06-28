//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Gary Kagan on 6/27/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Egg Sandwich"
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shopping", style: UIBarButtonItemStyle.Plain, target: self, action: "shopping")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shopping() {
        self.navigationController?.performSegueWithIdentifier("ShowShoppingListSegue", sender: self)
    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 2 {
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                switch (cell.accessoryType) {
                case .None:
                    cell.accessoryType = .Checkmark
                    break;
                    
                default:
                    cell.accessoryType = .None
                    break;
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        if indexPath.section == 2 {
            let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "+ Shopping List", handler: { (rowAction: UITableViewRowAction, indexPath: NSIndexPath) -> Void in
                tableView.editing = false
            })
            
            editAction.backgroundColor = UIColor(colorLiteralRed: 0.776, green: 0.117, blue: 0, alpha: 1.0)
            
            return [ editAction ]
        }
        return nil
    }
    
    func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)! as! RecipeIngredientItemTableViewCell
        cell.titleLabel.textAlignment = NSTextAlignment.Right
    }
    
    func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)! as! RecipeIngredientItemTableViewCell
        cell.titleLabel.textAlignment = NSTextAlignment.Left
    }
}

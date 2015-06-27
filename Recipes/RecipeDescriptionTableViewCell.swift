//
//  RecipeDescriptionTableViewCell.swift
//  Recipes
//
//  Created by Gary Kagan on 6/27/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//

import UIKit

class RecipeDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  RecipeListTableViewCell.swift
//  Recipes
//
//  Created by Gary Kagan on 6/27/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//

import UIKit

class RecipeListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shadeView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  CartTableViewCell.swift
//  FarmHouse
//
//  Created by Michael Park on 5/20/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var ItemLabel: UILabel!
    @IBOutlet weak var ItemQuantity: UITextField!
    @IBOutlet weak var ItemUnits: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

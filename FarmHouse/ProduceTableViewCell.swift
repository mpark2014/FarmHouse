//
//  ProduceTableViewCell.swift
//  FarmHouse
//
//  Created by Matthew Park on 5/19/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class ProduceTableViewCell: UITableViewCell {

    @IBOutlet weak var ProduceLabel: UILabel!
    @IBOutlet weak var ProducePrice: UILabel!
    @IBOutlet weak var ProduceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

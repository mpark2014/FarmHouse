//
//  InfoBarCollectionViewCell.swift
//  FarmHouse
//
//  Created by Michael Park on 5/20/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class InfoBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var MainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        MainImage.alpha = 0.75
    }
}

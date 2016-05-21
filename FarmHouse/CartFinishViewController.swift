//
//  CartFinishViewController.swift
//  FarmHouse
//
//  Created by Michael Park on 5/20/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class CartFinishViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.layer.cornerRadius = 8.0
        cart = ["Tomatoes":0,"Strawberries":0,"Lettuce":0,"Basil":0,"Mint":0,"Cilantro":0,"Cucumbers":0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

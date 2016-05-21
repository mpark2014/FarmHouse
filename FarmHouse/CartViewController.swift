//
//  CartViewController.swift
//  FarmHouse
//
//  Created by Michael Park on 5/20/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

extension Double {
    func fixedFractionDigits(digits: Int) -> String {
        return String(format: "%.\(digits)f", self)
    }
}

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var CheckOutButton: UIButton!
    @IBOutlet weak var TotalPriceLabel: UILabel!
    
    var itemsInCart:Dictionary<String, Double> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        CheckOutButton.layer.cornerRadius = CheckOutButton.frame.size.height/2.0
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        for (key, value) in cart {
            if value != 0 {
                itemsInCart[key] = value
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // ------------------
    // TABLE VIEW METHODS
    // ------------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInCart.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath) as! CartTableViewCell
        let key = Array(itemsInCart.keys)[indexPath.row]
        cell.ItemLabel.text = key
        cell.ItemQuantity.text = itemsInCart[key]?.fixedFractionDigits(2)
        
        return cell
    }
}

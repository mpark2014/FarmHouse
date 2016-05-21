//
//  PopoverViewController.swift
//  FarmHouse
//
//  Created by Matthew Park on 5/19/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

var cart : Dictionary<String, Double> = ["Tomatoes":0,"Strawberries":0,"Lettuce":0,"Basil":0,"Mint":0,"Cilantro":0,"Cucumbers":0]

class PopoverViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ExitButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var AddToCart: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var produceBlurb: UILabel!
    @IBOutlet weak var produceImage: UIImageView!
    @IBOutlet weak var quantityUnit: UILabel!
    @IBOutlet weak var produceLabel: UILabel!
    
    var produce : String!
    var price : Double!
    var unit : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 8.0
        textField.delegate = self
        textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        produceBlurb.text = "Buy our freshly picked " + produce + " and remember that all of our produce was picked hous before they got to you!"
        produceImage.image = UIImage(named: produce)
        quantityUnit.text = unit
        produceLabel.text = produce
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Exit(sender: AnyObject) {
        view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func AddToCart(sender: AnyObject) {
        if textField.text != "" {
            let enteredAmt : Double? = Double(textField.text!)
            cart[produce] = enteredAmt
            
            view.endEditing(true)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func textFieldDidChange(textField: UITextField) {
        let enteredAmt : Double? = Double(textField.text!)
        if enteredAmt != nil {
            let totalPrice = enteredAmt! * price
            let roundedTotalPrice = Double(round(100*totalPrice)/100)
            totalPriceLabel.text = "Total Price: $" + totalPrice.fixedFractionDigits(2)
        } else {
            totalPriceLabel.text = "Total Price: $0"
        }
    }
}

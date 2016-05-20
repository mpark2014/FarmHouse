//
//  PopoverViewController.swift
//  FarmHouse
//
//  Created by Matthew Park on 5/19/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ExitButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var AddToCart: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var index = -1
    var produce : String!
    var price : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 8.0
        textField.delegate = self
        textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
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
            view.endEditing(true)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func textFieldDidChange(textField: UITextField) {
        let enteredAmt : Double? = Double(textField.text!)
        if enteredAmt != nil {
            let totalPrice = enteredAmt! * price
            let roundedTotalPrice = Double(round(100*totalPrice)/100)
            totalPriceLabel.text = "Total Price: $" + String(roundedTotalPrice)
        } else {
            totalPriceLabel.text = "Total Price: $0"
        }
    }
}

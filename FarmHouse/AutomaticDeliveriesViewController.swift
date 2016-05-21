//
//  AutomaticDeliveriesViewController.swift
//  FarmHouse
//
//  Created by Michael Park on 5/20/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class AutomaticDeliveriesViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    var onDoneBlock : (() -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.layer.cornerRadius = 8.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Exit(sender: AnyObject) {
        onDoneBlock()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

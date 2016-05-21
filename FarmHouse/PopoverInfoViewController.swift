//
//  PopoverInfoViewController.swift
//  FarmHouse
//
//  Created by Michael Park on 5/20/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class PopoverInfoViewController: UIViewController {

    @IBOutlet weak var ExitButton: UIButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AutoDeliveriesSegue" {
            let vc = segue.destinationViewController as! AutomaticDeliveriesViewController
            vc.onDoneBlock = {
                UIView.animateWithDuration(0.3, animations: {
                    self.ExitButton.alpha = 1.0
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Exit(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func AutomaticDeliveries(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.ExitButton.alpha = 0
        })
    }
}

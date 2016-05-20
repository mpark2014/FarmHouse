//
//  ViewController.swift
//  FarmHouse
//
//  Created by Matthew Park on 5/19/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

let greenColor = UIColor(red: 176/255, green: 216/255, blue: 91/255, alpha: 0.75)
let blueColor = UIColor(red: 77/255, green: 119/255, blue: 138/255, alpha: 1.0)

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    // ----
    // DATA
    // ----
    
    let produceList = ["Tomatoes", "Strawberries", "Lettuce", "Mint", "Basil"]
    let priceList = ["$3/pound", "$4/pound", "$2.50/head", "$3/ounce", "$4/ounce"]
    let priceInt = [3, 4, 2.50, 3, 4]
    
    var sendDataProduce:String!
    var sendDataPrice:Double!
    
    // --------------
    // FORMATTING/NAV
    // --------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        navigationController!.navigationBar.barTintColor = greenColor
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: blueColor, NSFontAttributeName: UIFont(name: "Optima", size: 20)!]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popoverSegue" {
            let vc = segue.destinationViewController as! PopoverViewController
            vc.produce = sendDataProduce
            vc.price = sendDataPrice
        }
    }

    // ------------------
    // TABLE VIEW METHODS
    // ------------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produceList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProduceCell", forIndexPath: indexPath) as! ProduceTableViewCell
        cell.ProduceImage.image = UIImage(named: produceList[indexPath.row])
        cell.ProduceLabel.text = produceList[indexPath.row]
        cell.ProducePrice.text = priceList[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sendDataProduce = produceList[indexPath.row]
        sendDataPrice = priceInt[indexPath.row]
        
        dispatch_async(dispatch_get_main_queue()){
            self.performSegueWithIdentifier("popoverSegue", sender: self)
        }
    }
}


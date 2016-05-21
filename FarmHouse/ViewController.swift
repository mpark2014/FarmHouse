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
let blueColorTransparent = UIColor(red: 77/255, green: 119/255, blue: 138/255, alpha: 0.75)

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    // ----
    // DATA
    // ----
    
    let produceList = ["Tomatoes", "Strawberries", "Lettuce", "Mint", "Basil", "Cilantro", "Cucumbers"]
    let priceList = ["$3/pound", "$4/pound", "$2.50/head", "$3/ounce", "$4/ounce", "$4/ounce", "$2/pound"]
    let priceInt = [3, 4, 2.50, 3, 4, 4, 2]
    let units = ["pounds", "pounds", "heads", "pounds", "ounces", "ounces", "ounces", "ounces", "pounds"]
    let headerMessasges = ["Check out our new herbs and spices!","FREE shipping on every order!", "Delivery within hours!"]
    
    var sendDataProduce:String!
    var sendDataPrice:Double!
    var sendDataUnits:String!
    
    // --------------
    // FORMATTING/NAV
    // --------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        TableView.delegate = self
        TableView.dataSource = self
        
        TableView.contentInset = UIEdgeInsets(top: 128, left: 0, bottom: 0, right: 0)
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        navigationController!.navigationBar.barTintColor = greenColor
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: blueColor, NSFontAttributeName: UIFont(name: "Optima-Bold", size: 20)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popoverSegue" {
            let vc = segue.destinationViewController as! PopoverViewController
            vc.produce = sendDataProduce
            vc.price = sendDataPrice
            vc.unit = sendDataUnits
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
        sendDataUnits = units[indexPath.row]
        
        dispatch_async(dispatch_get_main_queue()){
            self.performSegueWithIdentifier("popoverSegue", sender: self)
        }
    }
    
    // -----------------------
    // COLLECTION VIEW METHODS
    // -----------------------
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerMessasges.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("InfoBarCell", forIndexPath: indexPath) as! InfoBarCollectionViewCell
        cell.MainLabel.text = headerMessasges[indexPath.row]
        cell.layer.backgroundColor = blueColorTransparent.CGColor
        return cell
    }
}


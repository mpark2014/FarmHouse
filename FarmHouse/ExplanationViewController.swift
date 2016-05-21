//
//  ExplanationViewController.swift
//  FarmHouse
//
//  Created by Michael Park on 5/20/16.
//  Copyright © 2016 Matthew Park. All rights reserved.
//

import UIKit

class ExplanationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var MainPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Back(sender: AnyObject) {
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Fade)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // -----------------------
    // COLLECTION VIEW METHODS
    // -----------------------
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("ExplanationCell1", forIndexPath: indexPath)
        } else if indexPath.row == 1 {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("ExplanationCell2", forIndexPath: indexPath)
        } else if indexPath.row == 2 {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("ExplanationCell3", forIndexPath: indexPath)
        } else if indexPath.row == 3 {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("ExplanationCell4", forIndexPath: indexPath)
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize = CGSizeMake(collectionView.frame.width, collectionView.frame.height)
        print(cellSize)
        return cellSize
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        MainPageControl.currentPage = (CollectionView.indexPathsForVisibleItems().first?.row)!
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        MainPageControl.currentPage = (CollectionView.indexPathsForVisibleItems().first?.row)!
    }
}

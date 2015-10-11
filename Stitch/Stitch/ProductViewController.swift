//
//  ProductViewController.swift
//  Stitch
//
//  Created by Ravin Sardal on 10/10/15.
//  Copyright © 2015 Ravin Sardal. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController: UIViewController {
    private var defaults:NSUserDefaults!
    private var urlOfProduct:String!
    private var indexOfProduct:Int!
    
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var leftSmallImageVIew: UIImageView!
    @IBOutlet var middleSmallImageView: UIImageView!
    @IBOutlet var rightSmallImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //defualts synchro
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        self.urlOfProduct = defaults.objectForKey("productURL") as? String
        
        
        if let url = NSURL(string: self.urlOfProduct) {
            if let data = NSData(contentsOfURL: url){
                mainImageView.contentMode = UIViewContentMode.ScaleAspectFit
                mainImageView.image = UIImage(data: data)
            }
        }
        
        if let url = NSURL(string: self.urlOfProduct) {
            if let data = NSData(contentsOfURL: url){
                leftSmallImageVIew.contentMode = UIViewContentMode.ScaleAspectFit
                leftSmallImageVIew.image = UIImage(data: data)
                leftSmallImageVIew.transform = CGAffineTransformMakeRotation(0.50);
            }
        }
        
        if let url = NSURL(string: self.urlOfProduct) {
            if let data = NSData(contentsOfURL: url){
                middleSmallImageView.contentMode = UIViewContentMode.ScaleAspectFit
                middleSmallImageView.image = UIImage(data: data)
            }
        }
        
        if let url = NSURL(string: self.urlOfProduct) {
            if let data = NSData(contentsOfURL: url){
                rightSmallImageView.contentMode = UIViewContentMode.ScaleAspectFit
                rightSmallImageView.image = UIImage(data: data)
                rightSmallImageView.transform = CGAffineTransformMakeRotation(-0.50);
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
}

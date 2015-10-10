//
//  ExploreViewController.swift
//  Stitch
//
//  Created by Ravin Sardal on 10/10/15.
//  Copyright © 2015 Ravin Sardal. All rights reserved.
//

import Foundation
import UIKit

class ExploreViewController: UIViewController{
    
    private var defaults:NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func featuredButtonPressed(sender: AnyObject) {
        self.setVCvalue("featured")
    }
    @IBAction func shirtsButtonPressed(sender: AnyObject) {
        self.setVCvalue("shirts")
    }
    @IBAction func jacketsButtonPressed(sender: AnyObject) {
        self.setVCvalue("jackets")
    }
    @IBAction func shoesButtonPressed(sender: AnyObject) {
        self.setVCvalue("shoes")
    }

    @IBAction func hatsButtonPressed(sender: AnyObject) {
        self.setVCvalue("hats")
    }

    @IBAction func pantsButtonPressed(sender: AnyObject) {
        self.setVCvalue("pants")
    }
    
    private func setVCvalue(val:String){
        defaults.setObject(val, forKey: "exploreVCval")
        defaults.synchronize()
        let exploreVCvalueObj = defaults.objectForKey("exploreVCval")
        
//        if let exploreVCvalueObj = exploreVCvalueObj{
//            print(exploreVCvalueObj)
//        }
    }

}
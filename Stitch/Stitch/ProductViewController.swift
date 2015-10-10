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
    private var typeOfProduct:String!
    @IBOutlet var productLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //defualts synchro
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        self.typeOfProduct = defaults.objectForKey("productImageSelected") as? String
        self.productLabel.text = typeOfProduct
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
}

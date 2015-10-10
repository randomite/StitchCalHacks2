//
//  ProductListViewController.swift
//  Stitch
//
//  Created by Ravin Sardal on 10/10/15.
//  Copyright © 2015 Ravin Sardal. All rights reserved.
//

import Foundation
import UIKit

class ProductListViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet var titleLabel: UILabel!
    private var defaults:NSUserDefaults!
    private var productTypeName: String!
    private var scrollerHeight:Int!
    
    @IBOutlet var scroller: UIScrollView!
    
    //array that stores image names from backend
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        self.productTypeName = defaults.objectForKey("exploreVCval") as? String
        self.titleLabel.text = productTypeName
        
        self.scrollerHeight = 10*356 //instead of 10, have length of image name array
        self.scroller.contentSize = CGSize(width: 375, height: self.scrollerHeight + 60)
        
        for(var i=60;i<=self.scrollerHeight;i+=356){
            self.createImage("login_background_2.png", rect: CGRect(x: 33, y: i, width: 308, height: 308))
        }

    }
    
    override func viewDidAppear(animated: Bool) {
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createImage(imgName: String, rect:CGRect){
        let imageName = imgName
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = rect
        scroller.addSubview(imageView)
    }
}
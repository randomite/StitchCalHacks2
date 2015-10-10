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
    
    //initialize the array that stores image names from backend
    private var imageNames: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init all the user defaults stuff
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        self.productTypeName = defaults.objectForKey("exploreVCval") as? String
        self.titleLabel.text = productTypeName
        
        
        //@TODO get all the image names from the backend and populate array over here
        self.imageNames.removeAtIndex(0)
        for(var i=0;i<3;i++){
            self.imageNames.insert("login_background_2.png", atIndex: i)
        }
        
        
        //actually put the images into the scroll view
        self.scrollerHeight = self.imageNames.count*356
        self.scroller.contentSize = CGSize(width: 375, height: self.scrollerHeight + 60)
        
        var height:Int = 60;
        for (_, value) in imageNames.enumerate() {
            self.createImage(value, rect: CGRect(x: 33, y: height, width: 308, height: 308))
            height += 356;
        }

    }
    
    override func viewDidAppear(animated: Bool) {
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createImage(imgName: String, rect:CGRect){
        //@TODO create the image from a url
        let imageName = imgName
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = rect
        scroller.addSubview(imageView)
    }
}
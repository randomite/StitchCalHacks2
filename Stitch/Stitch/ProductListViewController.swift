//
//  ProductListViewController.swift
//  Stitch
//
//  Created by Ravin Sardal on 10/10/15.
//  Copyright © 2015 Ravin Sardal. All rights reserved.
//

import Foundation
import UIKit

class ProductListViewController: UIViewController{
    @IBOutlet var titleLabel: UILabel!
    private var defaults:NSUserDefaults!
    private var productTypeName: String!
    
    @IBOutlet var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        self.productTypeName = defaults.objectForKey("exploreVCval") as? String
        self.titleLabel.text = productTypeName
        
        self.createImage("login_background_2.png", rect: CGRect(x: 33, y: 60, width: 308, height: 308))
        self.createImage("login_background_2.png", rect: CGRect(x: 33, y: 416, width: 308, height: 308))

        
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
        view.addSubview(imageView)
    }
}
//
//  ProductListViewController.swift
//  Stitch
//
//  Created by Ravin Sardal on 10/10/15.
//  Copyright © 2015 Ravin Sardal. All rights reserved.
//

import Foundation
import UIKit

class ProductListViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var titleLabel: UILabel!
    private var defaults:NSUserDefaults!
    private var productTypeName: String!
    private var scrollerHeight:Int!
    
    @IBOutlet var scroller: UIScrollView!
    
    //initialize the array that stores image names from backend
    //make this into a hash map, with the image name, and position in the VC
    private var imageNames: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init all the user defaults stuff
        defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        self.productTypeName = defaults.objectForKey("exploreVCval") as? String
        //self.titleLabel.text = productTypeName
        
        
        //@TODO get all the image names from the backend and populate array over here
        self.imageNames.removeAtIndex(0)
        for(var i=0;i<5;i++){
            //self.imageNames.insert("login_background_2.png", atIndex: i)
            
            //self.imageNames.insert("http://192.168.1.3000/\(self.productTypeName)/\(String(i+1))", atIndex: i)
            self.imageNames.insert("http://104.236.168.5/assets/\(self.productTypeName)/\(self.productTypeName)\(String(i+1)).jpg", atIndex: i)
            
            
            //self.imageNames.insert("http://104.236.168.5/assets/\(self.productTypeName)/shirt\(String(i+1)).jpg", atIndex: i)
            print("http://104.236.168.5/assets/\(self.productTypeName)/\(self.productTypeName)\(String(i+1)).jpg")
            
        }
        
        
        //actually put the images into the scroll view
        self.scrollerHeight = self.imageNames.count*356
        self.scroller.contentSize = CGSize(width: 375, height: self.scrollerHeight + 60)
        
        var height:Int = 60;
        for (_, value) in imageNames.enumerate() {
            //self.createImage(value, rect: CGRect(x: 33, y: height, width: 308, height: 308))
            self.createImageFromURL(value, rect: CGRect(x: 33, y: height, width: 308, height: 308))
            self.createButton(value, rect: CGRect(x: 33, y: height, width: 308, height: 308))
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
        
        let imageName = imgName
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = rect
        //imageView.userInteractionEnabled = true
        scroller.addSubview(imageView)
    }
    
    private func createImageFromURL(imgName:String, rect:CGRect){
//        let imageName = imgName
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//        imageView.frame = rect
//        //imageView.userInteractionEnabled = true
//        scroller.addSubview(imageView)
        
        let imageView:UIImageView = UIImageView()
        
        if let url = NSURL(string: imgName) {
            if let data = NSData(contentsOfURL: url){
                imageView.contentMode = UIViewContentMode.ScaleAspectFit
                imageView.image = UIImage(data: data)
            }
        }
        
        imageView.frame = rect
        scroller.addSubview(imageView)
    }
    
    private func createButton(backGroundImageName: String, rect:CGRect){
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = rect
        //button.backgroundColor = UIColor.greenColor()
        //button.setImage(UIImage(named: backGroundImageName), forState: UIControlState.Normal)
        button.setTitle(backGroundImageName, forState: UIControlState.Normal)
        button.titleLabel?.removeFromSuperview()
        button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.scroller.addSubview(button)
    }
    
    func buttonClicked(sender:UIButton!){
        self.defaults.setObject(sender.titleLabel?.text, forKey: "productURL")
        defaults.synchronize()
        let obj = defaults.objectForKey("productURL") as? String
        print(obj)
        
        //show the appropriate new VC
        
        /*
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
        loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.window.rootViewController presentModalViewController:loginVC animated:YES];
        */
        
//        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let productVC:UIViewController = storyboard.instantiateViewControllerWithIdentifier("ProductViewController")
//        productVC.modalPresentationStyle = UIModalPresentationStyle.FullScreen
//        self.presentViewController(productVC, animated: true, completion: nil)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("ProductViewController") 
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
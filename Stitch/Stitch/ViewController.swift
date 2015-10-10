//
//  ViewController.swift
//  Stitch
//
//  Created by Ravin Sardal on 10/9/15.
//  Copyright © 2015 Ravin Sardal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    private var genericTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.userInteractionEnabled = true;
        self.scrollView.contentSize = CGSizeMake(375, 400)
        self.scrollView.flashScrollIndicators()
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func loginButtonPressed(sender: AnyObject) {
//        self.scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
//        self.textFieldShouldReturn(genericTextField)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.scrollView.setContentOffset(CGPointMake(0.0, 200.0), animated: true)
        self.genericTextField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

}


//
//  ViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/19/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import ObjectiveDDP

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    var meteor: MeteorClient! = MeteorClientManager.sharedInstance.getMeteorClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


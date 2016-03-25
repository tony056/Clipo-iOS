//
//  CPNavigationController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/26/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import Material

class CPNavigationController: NavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupToolbar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupToolbar(){
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Material"
        titleLabel.textAlignment = .Left
        titleLabel.textColor = MaterialColor.white
        
        // Detail label.
        let detailLabel: UILabel = UILabel()
        detailLabel.text = "Build Beautiful Software"
        detailLabel.textAlignment = .Left
        detailLabel.textColor = MaterialColor.white
        
        var image: UIImage? = MaterialIcon.menu
        
        // Menu button.
        let menuButton: FlatButton = FlatButton()
        menuButton.pulseColor = MaterialColor.white
        menuButton.pulseScale = false
        menuButton.tintColor = MaterialColor.white
        menuButton.setImage(image, forState: .Normal)
        menuButton.setImage(image, forState: .Highlighted)
        
        // Switch control.
        let switchControl: MaterialSwitch = MaterialSwitch(state: .Off, style: .LightContent, size: .Small)
        
        // Search button.
        image = MaterialIcon.search
        let searchButton: FlatButton = FlatButton()
        searchButton.pulseColor = MaterialColor.white
        searchButton.pulseScale = false
        searchButton.tintColor = MaterialColor.white
        searchButton.setImage(image, forState: .Normal)
        searchButton.setImage(image, forState: .Highlighted)
        
        let toolbar: Toolbar = Toolbar()
        toolbar.statusBarStyle = .LightContent
        toolbar.backgroundColor = MaterialColor.blue.base
        toolbar.titleLabel = titleLabel
        toolbar.detailLabel = detailLabel
        toolbar.leftControls = [menuButton]
        toolbar.rightControls = [switchControl, searchButton]
        
        view.addSubview(toolbar)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

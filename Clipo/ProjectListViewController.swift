//
//  ProjectListViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/30/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import Material

class ProjectListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    var addMenu : Menu!
    private lazy var menuView: MenuView = MenuView()
    private let baseViewSize: CGSize = CGSizeMake(56, 56)
    
    /// MenuView inset.
    private let menuViewInset: CGFloat = 16
    var crewMembers = [CrewMember]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crewMembers = [
            CrewMember(name: "Ezra Bridger", imageName: "ezra"),
            CrewMember(name: "Kanan Jarrus", imageName: "kanan"),
            CrewMember(name: "Hera Syndulla", imageName: "hera"),
            CrewMember(name: "Sabine Wren", imageName: "sabine"),
            CrewMember(name: "Zeb Orrelios", imageName: "zeb")
        ]
        prepareForMenu()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareForMenu(){
        print("preparing......")
        var image: UIImage? = MaterialIcon.add
        let addBtn: FabButton = FabButton()
        addBtn.pulseColor = nil
        addBtn.setImage(image, forState: .Normal)
        addBtn.setImage(image, forState: .Highlighted)
        addBtn.addTarget(self, action: #selector(handleMenu), forControlEvents: .TouchUpInside)
        menuView.addSubview(addBtn)
        
        image = MaterialIcon.menu
        let noteBtn: FabButton = FabButton()
        noteBtn.backgroundColor = MaterialColor.blue.base
        noteBtn.setImage(image, forState: .Normal)
        noteBtn.setImage(image, forState: .Highlighted)
        menuView.addSubview(noteBtn)
        
        image = UIImage(named: "ic_photo_camera_white")
        let photoBtn: FabButton = FabButton()
        photoBtn.setImage(image, forState: .Normal)
        photoBtn.setImage(image, forState: .Highlighted)
        menuView.addSubview(photoBtn)
        
//        menuView = Menu(origin: CGPointMake(view.bounds.width - 56 - 16, view.bounds.height - 56 - 16))
        menuView.menu.direction = .Up
        menuView.menu.baseViewSize = CGSizeMake(56, 56)
        menuView.menu.views = [addBtn, noteBtn, photoBtn]
        
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.size(view, child: menuView, width: baseViewSize.width, height: baseViewSize.height)
        MaterialLayout.alignFromBottomRight(view, child: menuView, bottom: 32, right: menuViewInset)
    }
    
    func handleMenu(){
        let image: UIImage?
        
        if menuView.menu.opened {
            menuView.menu.close()
            image = MaterialIcon.add
        } else {
            menuView.menu.open() { (v: UIView) in
                (v as? MaterialButton)?.pulse()
            }
            image = MaterialIcon.close
        }
        
        // Add a nice rotation animation to the base button.
        let first: MaterialButton? = menuView.menu.views?.first as? MaterialButton
        first?.animate(MaterialAnimation.rotate(rotation: 1))
        first?.setImage(image, forState: .Normal)
        first?.setImage(image, forState: .Highlighted)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crewMembers.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("projectCell", forIndexPath: indexPath)
        
        return cell
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

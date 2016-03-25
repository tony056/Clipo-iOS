//
//  ProjectTableViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/21/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import Material


struct CrewMember {
    let name: String
    let imageName: String
    var expanded = false
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

class ProjectTableViewController: UITableViewController, SectionHeaderViewDelegate {
    var crewMembers = [CrewMember]()
    var sectionIndex = [Bool](count: 2, repeatedValue: false)
    var hideSection = -1
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupToolbar()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        crewMembers = [
            CrewMember(name: "Ezra Bridger", imageName: "ezra"),
            CrewMember(name: "Kanan Jarrus", imageName: "kanan"),
            CrewMember(name: "Hera Syndulla", imageName: "hera"),
            CrewMember(name: "Sabine Wren", imageName: "sabine"),
            CrewMember(name: "Zeb Orrelios", imageName: "zeb")
        ]
        let nib = UINib(nibName: "TopicSectionHeaderView", bundle: nil)
        self.tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "TopicSectionHeaderView")
//        self.tableView.tableFooterView = UIView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.sectionIndex[section] {
            return 0
        }
        
        return self.crewMembers.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("projectCell", forIndexPath: indexPath) as! ProjectExpandTableViewCell
        
        cell.crewMember = crewMembers[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        var indexPathToReturn: NSIndexPath?
        var crewMember = crewMembers[indexPath.row]
        
        if crewMember.expanded {
            crewMember.expanded = false
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.tableView(tableView, didDeselectRowAtIndexPath: indexPath)
        } else {
            crewMember.expanded = true
            indexPathToReturn = indexPath
        }
        
        crewMembers[indexPath.row] = crewMember
        
        return indexPathToReturn
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("TopicSectionHeaderView")
        let header = cell as! TopicTableSectionHeader
        header.titleLabel.text = "Section \(section)"
        header.sectionNum = section
        header.delegate = self
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func sectionHeaderView(sectionHeaderView: TopicTableSectionHeader, expandable: Bool) {
        print("section header")
        self.sectionIndex[sectionHeaderView.sectionNum] = expandable
        self.tableView.reloadData()
    
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
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

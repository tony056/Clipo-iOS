//
//  TopicTableViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/23/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit


class TopicTableViewController: UITableViewController {

    var crewMembers = [CrewMember]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TopicSectionHeaderView", bundle: nil)
        self.tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "TopicSectionHeaderView")
        crewMembers = [
            CrewMember(name: "Ezra Bridger", imageName: "ezra"),
            CrewMember(name: "Kanan Jarrus", imageName: "kanan"),
            CrewMember(name: "Hera Syndulla", imageName: "hera"),
            CrewMember(name: "Sabine Wren", imageName: "sabine"),
            CrewMember(name: "Zeb Orrelios", imageName: "zeb")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.crewMembers.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let currSection = self.fetchedResultsController.sections?[section]
//        let title = currSection!.name
        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("TopicSectionHeaderView")
        let header = cell as! TopicTableSectionHeader
        header.titleLabel.text = "Haha"
        
        return cell
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("projectCell", forIndexPath: indexPath) as! ProjectExpandTableViewCell

        cell.crewMember = crewMembers[indexPath.row]

        return cell
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

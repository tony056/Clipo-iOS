//
//  NotificationPageViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/21/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit

class NotificationPageViewController: UIPageViewController {
    
    
    var pages = [UIViewController]()
    let vcList = ["commentList", "activityList"]

    func setViewControllerForIndex(index: Int){
        let viewController : UIViewController = pages[index]
        setViewControllers([viewController], direction: .Forward, animated: false, completion: nil)
    }
    
    @IBAction func notificationTypeChanged(sender: UISegmentedControl) {
        setViewControllerForIndex(sender.selectedSegmentIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPageViewList()
        self.setViewControllerForIndex(0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initPageViewList() -> Void {
        let commentNotificationViewController : UIViewController! = storyboard?.instantiateViewControllerWithIdentifier(vcList[0])
        let activityNotificationViewController : UIViewController! = storyboard?.instantiateViewControllerWithIdentifier(vcList[1])
        self.pages.append(commentNotificationViewController)
        self.pages.append(activityNotificationViewController)
    }
}

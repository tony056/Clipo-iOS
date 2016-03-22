//
//  FileBrowseViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/22/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import Alamofire

class FileBrowseViewController: UIViewController {

    
    var finalPath : NSURL?
    @IBOutlet weak var fileBrowser: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.download(.GET, "https://s.yimg.com/bt/api/res/1.2/gHtNR6hz_aVgzQuxar.EhQ--/YXBwaWQ9eW5ld3NfbGVnbztjaD04MDA7Y3I9MTtjdz02MDg7ZHg9MDtkeT0wO2ZpPXVsY3JvcDtoPTI1MDtxPTc1O3c9MTkw/http://l.yimg.com/os/publish-images/news/2016-03-22/e4dc6760-efef-11e5-a355-3f02b271cc9a_20160322DCPHO980BG23_0002L.jpg", destination: {
            (temporaryURL, response) in
            let fileManager = NSFileManager.defaultManager()
            let directoryURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
            let pathComponent = response.suggestedFilename
            self.finalPath = directoryURL.URLByAppendingPathComponent(pathComponent!)
            return self.finalPath!
        }).response{
            (request, response, data, error) in
            if error != nil {
                print("Download Error: \(error)")
                return
            }
            print("Download ok")
            self.loadDataToWebView(self.finalPath!)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataToWebView(dataURL : NSURL) -> Void {
        let urlRequest = NSURLRequest(URL: dataURL)
        self.fileBrowser.loadRequest(urlRequest)
//        self.fileBrowser.loadData(data!, MIMEType: "application/jpg", textEncodingName: "", baseURL: NSURL())
        
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

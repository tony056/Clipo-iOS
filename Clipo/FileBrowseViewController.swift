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
        Alamofire.download(.GET, "http://jessehsiu.github.io/resume.pdf", destination: {
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

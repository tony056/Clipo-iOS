//
//  AppDelegate.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/19/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import ObjectiveDDP

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{

    var window: UIWindow?
    var clipoMeteorClient = MeteorClientManager.sharedInstance.initializeMeteor("pre2", server: "ws://stage.theclipo.com/websocket")
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        print("app is ready to be launched")
//        self.clipoMeteorClient = MeteorClientManager.sharedInstance.initializeMeteor("pre2", server: "wss://stage.theclipo.com")
        var configureError : NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.reportConnection(_:)), name: MeteorClientDidConnectNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.reportDisconnection(_:)), name: MeteorClientDidDisconnectNotification, object: nil)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication,
        openURL url: NSURL, options: [String: AnyObject]) -> Bool {
            return GIDSignIn.sharedInstance().handleURL(url,
                sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as! String,
                annotation: options[UIApplicationOpenURLOptionsAnnotationKey] as? String)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        var options: [String: AnyObject] = [UIApplicationOpenURLOptionsSourceApplicationKey: sourceApplication!,
            UIApplicationOpenURLOptionsAnnotationKey: annotation]
        return GIDSignIn.sharedInstance().handleURL(url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if (error == nil){
            let userId = user.userID
            let idToken = user.authentication.idToken
            let name = user.profile.name
            let email = user.profile.email
            let accessToken = user.authentication.accessToken
            print("Got the user: \(name), id: \(userId), token: \(idToken), email: \(email)")
            self.clipoMeteorClient.callMethodName("ping", parameters: nil, responseCallback: {
                (response, error) -> Void in
                if(error == nil){
                    print("\(response)")
                }
                else{
                    print("Error: \(error.localizedDescription)")
                }
            })
            
            self.clipoMeteorClient.signupWithUsernameAndEmail("tonytestclipo", email: "b00902056@ntu.edu.tw", password: "1234", fullname: "tony clipo", responseCallback: {
                (response, error) -> Void in
                if(error != nil){
                    print("Sign up failedQQ: \(error.localizedDescription)")
                    return
                }
                print("Sign up worked: \(response)")
                
            })
            
            
        }else {
            print("\(error.localizedDescription)")
        }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
        disconnectUser()
    }
    
    func reportConnection(notification: NSNotification){
        print("=================> Connected to the server!")
    }
    
    func reportDisconnection(notification: NSNotification){
        print("=================> Disconnected to the server!")
    }
    
    func disconnectUser(){
        print("=================> User disconnected")
    }
    
    func logInWithGoogleAccount(idToken: String) -> Void {
        self.clipoMeteorClient.logonWithOAuthAccessToken(idToken, serviceName: "google", responseCallback: {
            (response, error) -> Void in
            if((error) != nil){
                print("Clipo log in failed: \(error.localizedDescription), \(response)")
                return
            }
            print("Clipo log in succeeded")
            let params = [["name":"Fuck", "description":"come on", "isPublic":true]]
            self.clipoMeteorClient.callMethodName("createBoard", parameters: params as [AnyObject], responseCallback: {
                (response, error) -> Void in
                print("\(response)")
                print("Error: \(error.localizedDescription)")
            })
            
        })
    }

}


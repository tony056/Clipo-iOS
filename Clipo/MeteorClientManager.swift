//
//  MeteorClientManager.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/19/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import ObjectiveDDP

class MeteorClientManager {
    static let sharedInstance = MeteorClientManager()
    private var meteorClient : MeteorClient!
    
    private init(){
        print("Utils had been initialized");
    }
    
    func initializeMeteor(version: String,server endpoint: String) -> MeteorClient {
        self.meteorClient = MeteorClient(DDPVersion: version)
        let ddpConnection = ObjectiveDDP(URLString: endpoint, delegate: self.meteorClient)
        self.meteorClient.ddp = ddpConnection
        self.meteorClient.ddp.connectWebSocket()
        return self.meteorClient
    }
    
    func getMeteorClient() -> MeteorClient {
        return self.meteorClient
//        return nil
    }
}

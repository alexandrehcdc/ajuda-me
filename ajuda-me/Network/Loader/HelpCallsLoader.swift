//
//  HelpCallsLoader.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/18/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

public class HelpCallsLoader {
    
    let helpRequestDataSource: HelpRequestDataSource
    
    init() {
        let realm = try! Realm()
        
        self.helpRequestDataSource = HelpRequestDataSourceImpl.getInstance(realm: realm)
        
    }
    
    func saveMapPoints(json: JSON) {
        
        for (_, obj) in json {
            
            let helpRequest = HelpRequest()
            
            helpRequest.id               = obj["_id"].stringValue
            helpRequest.callerId         = obj["userId"].stringValue
            helpRequest.serviceId        = obj["serviceId"].stringValue
            helpRequest.timestamp        = obj["timestamp"].stringValue
            helpRequest.callerLocation   = String("\(obj["geometry"]["coordinates"][0].stringValue)/\(obj["geometry"]["coordinates"][1].stringValue)")
            
            helpRequestDataSource.save(entity: helpRequest)
        }
        
        let teste = helpRequestDataSource.findAll()
    }
    
    public func LoadMapPoints() {
        let teste = EndpointBuilder()
            .withHelpCall()
            .getPath()
        Caller.get(url: EndpointBuilder()
            .withHelpCall()
            .getPath(), saveMapPoints)
    }
    
}

//
//  ServicePointLoader.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/12/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

public class ServicePointLoader {
    
    let servicePointDataSource: ServicePointDataSource
    
    init() {
        let realm = try! Realm()
        
        self.servicePointDataSource = ServicePointDataSourceImpl.getInstance(realm: realm)
        
    }
    
    func saveMapPoints(json: JSON) {
        
        for (_, obj) in json {
            
            let servicePoint = ServicePoint()
            
            servicePoint.id               = obj["_id"].stringValue
            servicePoint.name             = obj["properties"]["Nome"].stringValue
            servicePoint.city             = obj["properties"]["Município"].stringValue
            servicePoint.address          = obj["properties"]["Endereço"].stringValue
            servicePoint.firstCoordinate  = obj["geometry"]["coordinates"][0].stringValue
            servicePoint.secondCoordinate = obj["geometry"]["coordinates"][1].stringValue
            servicePoint.thirdCoordinate  = obj["geometry"]["coordinates"][2].stringValue
            
            servicePointDataSource.save(entity: servicePoint)
        }
        
        let teste = servicePointDataSource.findAll()
    }
    
    public func LoadMapPoints() {
        Caller.get(url: EndpointBuilder()
            .withBases()
            .getPath(), saveMapPoints)
    }
    
}

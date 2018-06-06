//
//  ServicePointDataSourceImpl.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

public class ServicePointDataSourceImpl : ServicePointDataSource {
    
    private let realm: Realm
    private static var INSTANCE: ServicePointDataSourceImpl?
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> ServicePointDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = ServicePointDataSourceImpl(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func save(entity: ServicePoint) -> ServicePoint {
        do {
            try realm.write {
                realm.add(entity, update: true)
            }
        } catch {
            return ServicePoint()
        }
        
        return entity
    }
    
    public func findBy(id: String) -> ServicePoint {
        let foundService = realm.object(ofType: ServicePoint.self, forPrimaryKey: id)
        
        return foundService == nil ? ServicePoint() : foundService!
    }
    
    public func findAll() -> [ServicePoint] {
        return Array(realm.objects(ServicePoint.self))
    }
    
    public func destroyManyBy(ids: [String]) {
        do {
            try realm.write {
                let objectsToDelete = realm.objects(ServicePoint.self).filter("id IN %@", ids)
                realm.delete(objectsToDelete)
            }
        } catch {}
    }
    
    
}

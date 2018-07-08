//
//  OccurrencesLocalDataSourceImpl.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/8/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

public class OccurrencesLocalDataSourceImpl : OccurrencesLocalDataSource {
    
    private let realm: Realm
    private static var INSTANCE: OccurrencesLocalDataSourceImpl?
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> OccurrencesLocalDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = OccurrencesLocalDataSourceImpl(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func findBy(id: String) -> Occurrence {
        
        let foundOccurrence = realm.object(ofType: Occurrence.self, forPrimaryKey: id)
 
        return foundOccurrence == nil ? Occurrence() : foundOccurrence!
    }
    
    public func findAll() -> [Occurrence] {
        return Array(realm.objects(Occurrence.self))
    }
    
    public func destroyManyBy(ids: [String]) {
        do {
            try realm.write {
                let objectsToDelete = realm.objects(Occurrence.self).filter("id IN %@", ids)
                realm.delete(objectsToDelete)
            }
        } catch {}
    }
    
    public func save(entity: Occurrence) -> Occurrence {
        do {
            try realm.write {
                realm.add(entity, update: true)
            }
        } catch {
            return Occurrence()
        }
        
        return entity
    }
    
}

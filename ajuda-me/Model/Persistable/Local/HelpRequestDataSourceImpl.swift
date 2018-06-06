//
//  HelpRequestDataSourceImpl.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

public class HelpRequestDataSourceImpl : HelpRequestDataSource {
    
    private let realm: Realm
    private static var INSTANCE: HelpRequestDataSourceImpl?
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> HelpRequestDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = HelpRequestDataSourceImpl(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func save(entity: HelpRequest) -> HelpRequest {
        do {
            try realm.write {
                realm.add(entity, update: true)
            }
        } catch {
            return HelpRequest()
        }
        
        return entity
    }
    
    public func findBy(id: String) -> HelpRequest {
        let foundHelpRequest = realm.object(ofType: HelpRequest.self, forPrimaryKey: id)
        
        return foundHelpRequest == nil ? HelpRequest() : foundHelpRequest!
    }
    
    public func findAll() -> [HelpRequest] {
        return Array(realm.objects(HelpRequest.self))
    }
    
    public func destroyManyBy(ids: [String]) {
        do {
            try realm.write {
                let objectsToDelete = realm.objects(HelpRequest.self).filter("id IN %@", ids)
                realm.delete(objectsToDelete)
            }
        } catch {}
    }
    
}

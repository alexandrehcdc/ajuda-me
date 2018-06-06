//
//  UserDataSourceImpl.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

public class UserDataSourceImpl : UserDataSource {
    
    private let realm: Realm
    private static var INSTANCE: UserDataSourceImpl?
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> UserDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = UserDataSourceImpl(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func save(entity: User) -> User {
        do {
            try realm.write {
                realm.add(entity, update: true)
            }
        } catch {
            return User()
        }
        
        return entity
    }
    
    public func findBy(id: String) -> User {
        let foundPerson = realm.object(ofType: User.self, forPrimaryKey: id)
        
        return foundPerson == nil ? User() : foundPerson!
    }
    
    public func findAll() -> [User] {
        return Array(realm.objects(User.self))
    }
    
    public func destroyManyBy(ids: [String]) {
        do {
            try realm.write {
                let objectsToDelete = realm.objects(User.self).filter("id IN %@", ids)
                realm.delete(objectsToDelete)
            }
        } catch {}
    }
    
    
}

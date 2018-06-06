//
//  UserDataSource.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation

public protocol UserDataSource {
    
    func save(entity: User) -> User
    func findBy(id: String) -> User
    func findAll() -> [User]
    func destroyManyBy(ids: [String]) -> Void
    
}

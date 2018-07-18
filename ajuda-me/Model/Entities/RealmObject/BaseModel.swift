//
//  BaseModel.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

public class BaseModel: Object {
    
    @objc dynamic var id = ""
    
    func getId() -> String {
        return self.id
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}

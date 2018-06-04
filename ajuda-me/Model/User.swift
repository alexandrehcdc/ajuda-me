//
//  User.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/4/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
//import RealmSwift

class User: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var password = ""
    @objc dynamic var email = ""
}

//
//  HelpRequests.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/4/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
//import RealmSwift

class HelpRequests: Object {
    @objc dynamic var id = ""
    @objc dynamic var callerId = ""
    @objc dynamic var serviceId = ""
    @objc dynamic var email = ""
}

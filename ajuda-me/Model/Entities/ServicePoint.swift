//
//  ServicePoint.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/4/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation

public class ServicePoint: BaseModel {
    @objc dynamic var name = ""
    @objc dynamic var geolocation = ""
    @objc dynamic var address = ""
    @objc dynamic var city = ""
    @objc dynamic var CEP = ""
}

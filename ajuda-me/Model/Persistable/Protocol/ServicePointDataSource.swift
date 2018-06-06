//
//  ServicePointDataSource.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation

public protocol ServicePointDataSource {
    
    func save(entity: ServicePoint) -> ServicePoint
    func findBy(id: String) -> ServicePoint
    func findAll() -> [ServicePoint]
    func destroyManyBy(ids: [String]) -> Void
    
}

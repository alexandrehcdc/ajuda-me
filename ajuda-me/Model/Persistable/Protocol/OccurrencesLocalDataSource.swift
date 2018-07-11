//
//  OccurrencesLocalDataSource.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/8/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation

public protocol OccurrencesLocalDataSource {
    
    func save(entity: Occurrence) -> Occurrence
    func saveMany(entities: [Occurrence]) -> [Occurrence]
    func findBy(id: String) -> Occurrence
    func findAll() -> [Occurrence]
    func destroyManyBy(ids: [String]) -> Void
    
}

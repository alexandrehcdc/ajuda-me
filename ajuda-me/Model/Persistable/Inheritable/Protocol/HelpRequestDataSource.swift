//
//  HelpRequestsDataSource.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation

public protocol HelpRequestDataSource {
    
    func save(entity: HelpRequest) -> HelpRequest
    func findBy(id: String) -> HelpRequest
    func findAll() -> [HelpRequest]
    func destroyManyBy(ids: [String]) -> Void
    
}

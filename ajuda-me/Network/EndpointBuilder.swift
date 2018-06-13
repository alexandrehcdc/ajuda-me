//
//  EndpointBuilder.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation

class EndpointBuilder {
    var BASE_URL = "https://whispering-lowlands-23613.herokuapp.com"
    
    func withLocation() -> EndpointBuilder {
        self.BASE_URL = BASE_URL + "/location"
        return self
    }
    
    func withBases() -> EndpointBuilder {
        self.BASE_URL = BASE_URL + "/bases"
        return self
    }
    
    func getPath() -> String {
        return self.BASE_URL
    }
}

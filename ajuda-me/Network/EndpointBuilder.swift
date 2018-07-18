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
    
    func withHelpCall() -> EndpointBuilder {
        self.BASE_URL = BASE_URL + "/helpCall"
        return self
    }
    
    func withAgent() -> EndpointBuilder {
        self.BASE_URL = BASE_URL + "/agent"
        return self
    }
    
    func withAmbulance() -> EndpointBuilder {
        self.BASE_URL = BASE_URL + "/ambulance"
        return self
    }
    
    func withBasesCount() -> EndpointBuilder {
        self.BASE_URL = BASE_URL + "/bases/available"
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

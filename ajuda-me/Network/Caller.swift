//
//  Caller.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import Alamofire

public class Caller {
    
    class func get(url: String) {
        Alamofire.request(url)
            .responseJSON { (response) in
                print(response)
        }
    }
    
}

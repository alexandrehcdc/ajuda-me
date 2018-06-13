//
//  Caller.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class Caller {
    
    class func get(url: String, _ exec: @escaping (_ response: JSON) -> Void) {
        
        Alamofire.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { (response) in
                
                if let result = response.result.value {
                    let json = JSON(result)
                    exec(json)
                }
                
            }
            .responseString { (response) in
                let formattedResponse = String(utf8String: response.result.value!.cString(using: .utf8)!)
                print(formattedResponse!)
        }
    }
    
}

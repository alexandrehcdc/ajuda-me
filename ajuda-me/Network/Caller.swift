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
    }
    
    class func post(url: String, parameters: [String: Any], _ exec: @escaping (_ response: JSON) -> Void) {
        print("dentro")
        Alamofire
            .request(url,
                     method: .post,
                     parameters: parameters, encoding: JSONEncoding.default,
                     headers: nil)
//            .responseJSON { response in
//                if let result = response.result.value {
//                    let json = JSON(result)
//                    exec(json)
//                    print("json?", json)
//                }
//                print(response.error)
//            }
            .responseString { response in
                print(response)
            }
        
    }
    
}

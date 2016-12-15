//
//  TealiumExtensions.swift
//  tealium-swift
//
//  Created by Jason Koo on 11/1/16.
//  Copyright © 2016 tealium. All rights reserved.
//

/**
     General Extensions that may be used by multiple objects.
*/
import Foundation

/**
 Extend boolvalue NSString function to Swift strings.
 */
extension String {
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
}

extension URLRequest {
    
    func asDictionary() -> [String : Any] {
        
        var result = [String:Any]()
        
        result["allowsCellularAccess"] = self.allowsCellularAccess ? "true" : "false"
        result["allHTTPHeaderFields"] = self.allHTTPHeaderFields
        result["cachePolicy"] = self.cachePolicy
        result["url"] = self.url?.absoluteString
        result["timeoutInterval"] = self.timeoutInterval
        result["httpMethod"] = self.httpMethod
        result["httpShouldHandleCookies"] = self.httpShouldHandleCookies
        result["httpShouldUsePipelining"] = self.httpShouldUsePipelining
        
        return result
    }
}

/**
 Extend the use of += operators to dictionaries.
*/
public func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

/**
 Extend use of == to dictionaries.
*/
public func ==(lhs: [String: AnyObject], rhs: [String: AnyObject] ) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}



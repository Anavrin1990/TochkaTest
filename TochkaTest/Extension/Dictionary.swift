//
//  Dictionary.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 04/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func stringFromHttpParameters() -> String {
        
        let parameterArray = self.map { (key, value) -> String in
            
            let percentEscapedKey = key
            let percentEscapedValue = value
            
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}

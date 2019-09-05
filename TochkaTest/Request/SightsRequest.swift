//
//  SightsRequest.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 04/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation

class SightsRequest: JSONRequest<SightResponse> {
    
    override var path: String {
        return "sights"
    }
    
    let count: Int16
    let offset: Int16
    
    init(count: Int16, offset: Int16, completion: @escaping ((SightResponse) -> Void)) {
                
        self.count = count
        self.offset = offset
        
        super.init(parameters: ["count" : count,
                                "offset" : offset])
        
        self.completion = completion
    }
    
    override func getCurrentObjectPredicate() -> NSPredicate? {
        
        return NSPredicate(format: "nextOffset == %@", String(offset + count))
    }
}

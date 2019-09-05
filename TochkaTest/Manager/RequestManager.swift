//
//  RequestManager.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation

class RequestManager {
    
    @discardableResult
    func getBaseRequest() -> BaseRequest {
        
        return BaseRequest()
    }
    
    @discardableResult
    func getSightRequest(count: Int16, offset: Int16, completion: @escaping (SightResponse) -> Void) -> SightsRequest {
        
        return SightsRequest(count: count, offset: offset, completion: completion)
    }
}

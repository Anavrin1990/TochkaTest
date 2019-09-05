//
//  BaseRequest.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 04/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BaseRequest {
    
    var dataCompletion: ((Data) -> Void)?
    
    var headers: [String : String] {
        return ["application/json" : "Content-Type"]
    }
    var path: String {
        return ""
    }
    var method: HTTPMethod {
        return .get
    }
    var debug: Bool {
        return false
    }    
    
    var coreDataManager = (UIApplication.shared.delegate as! AppDelegate).coreDataManager!
    
    func execute(url: String, parameters: [String : Any] = [:], dataCompletion: ((Data) -> Void)? = nil) {
        
        self.dataCompletion = dataCompletion
        
        var requestUrl = url
        
        if !path.isEmpty {
            requestUrl += "/\(path)"
        }
        
        if !parameters.isEmpty {
            switch method {
            case .get:
                requestUrl += "?\(parameters.stringFromHttpParameters())"
            default:
                break
            }
        }
        
        if debug {
            print(requestUrl)
        }        
        
        let request = NSMutableURLRequest(url: URL(string: requestUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
        request.httpMethod = self.method.rawValue
        
        for header in headers {
            request.addValue(header.key, forHTTPHeaderField: header.value)
        }
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 120
        
        session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            if let error = error {
                self.processErrors(error)
            } else {
                if let data = data {
                    self.processResponse(data)
                } else {
                    self.processErrors(nil)
                }
            }
        }).resume()
    }
    
    func processErrors(_ error: Error?) {
        
        print(error?.localizedDescription ?? "Error")
    }
    
    func processResponse(_ data: Data) {
        
        DispatchQueue.main.async {            
            self.dataCompletion?(data)
        }
    }
}

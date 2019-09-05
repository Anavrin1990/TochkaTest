//
//  JSONRequest.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class JSONRequest<T: NSManagedObject & Decodable>: BaseRequest {
    
    var completion: ((T) -> Void)?
    
    override var debug: Bool {
        return true
    }
    
    init(parameters: [String : Any]) {
        super.init()
        
        execute(url: ServerURL, parameters: parameters) 
    }
    
    override func processResponse(_ data: Data) {
        
        do {
            let decoder = JSONDecoder()
            decoder.userInfo[CodingUserInfoKey.context!] = coreDataManager.context
            
            let predicate = getCurrentObjectPredicate()
            
            if let savedObjects = coreDataManager.fetchAll(T.self, predicate: predicate) {
                for object in savedObjects {
                    coreDataManager.delete(object: object)
                }
            }
            _ = try decoder.decode(T.self, from: data)
            
            coreDataManager.saveContext()
            
            processCompletion()
            
        } catch let error {
            processCompletion()
            print(error)
        }
    }
    
    override func processErrors(_ error: Error?) {
        super.processErrors(error)
        
        processCompletion()
    }
    
    func processCompletion() {
        
        DispatchQueue.main.async {
            if let predicate = self.getCurrentObjectPredicate(), let object = self.coreDataManager.fetch(T.self, predicate: predicate) {
                self.completion?(object)
            }
        }
    }
    
    func getCurrentObjectPredicate() -> NSPredicate? {
        
        return nil
    }
}

//
//  SightResponse.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 04/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import CoreData

@objc(SightResponse)
class SightResponse: NSManagedObject, Decodable {
        
    @NSManaged public var nextOffset: Int16
    @NSManaged public var totalCount: Int32
    @NSManaged public var items: NSOrderedSet?
    
    enum CodingKeys: String, CodingKey {
        
        case nextOffset
        case totalCount
        case items
    }
    
    required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context else { fatalError("cannot find context key") }
        guard let context = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext else { fatalError("cannot Retrieve context") }
        
        self.init(context: context)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        nextOffset = try values.decode(Int16.self, forKey: .nextOffset)
        totalCount = try values.decode(Int32.self, forKey: .totalCount)        
        items = NSOrderedSet(array: try values.decode([Sight].self, forKey: .items))
    }
}

extension SightResponse {
    
    @objc(insertObject:inItemsAtIndex:)
    @NSManaged public func insertIntoItems(_ value: Sight, at idx: Int)
    
    @objc(removeObjectFromItemsAtIndex:)
    @NSManaged public func removeFromItems(at idx: Int)
    
    @objc(insertItems:atIndexes:)
    @NSManaged public func insertIntoItems(_ values: [Sight], at indexes: NSIndexSet)
    
    @objc(removeItemsAtIndexes:)
    @NSManaged public func removeFromItems(at indexes: NSIndexSet)
    
    @objc(replaceObjectInItemsAtIndex:withObject:)
    @NSManaged public func replaceItems(at idx: Int, with value: Sight)
    
    @objc(replaceItemsAtIndexes:withItems:)
    @NSManaged public func replaceItems(at indexes: NSIndexSet, with values: [Sight])
    
    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Sight)
    
    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Sight)
    
    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSOrderedSet)
    
    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSOrderedSet)
    
}

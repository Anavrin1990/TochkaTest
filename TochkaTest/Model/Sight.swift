//
//  Sight.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 04/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import CoreData

@objc(Sight)
class Sight: NSManagedObject, Decodable {
   
    @NSManaged public var text: String?
    @NSManaged public var longDescr: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var sightResponse: SightResponse?
    
    enum CodingKeys: String, CodingKey {
        
        case text
        case longDescr
        case imageUrl        
    }
    
    required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context else { fatalError("cannot find context key") }
        guard let context = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext else { fatalError("cannot Retrieve context") }
        
        self.init(context: context)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        text = try values.decode(String.self, forKey: .text)
        longDescr = try values.decode(String.self, forKey: .longDescr)
        imageUrl = try values.decode(String.self, forKey: .imageUrl)        
    }
}

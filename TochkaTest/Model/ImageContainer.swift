//
//  ImageContainer.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import CoreData

@objc(ImageContainer)
public class ImageContainer: NSManagedObject {
        
    @NSManaged public var imageUrl: String?
    @NSManaged public var image: NSData?
    
}

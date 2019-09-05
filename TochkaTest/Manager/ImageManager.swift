//
//  ImageManager.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit

class ImageManager {
    
    let coreDataManager: CoreDataManager
    let requestManager: RequestManager
    
    init(coreDataManager: CoreDataManager, requestManager: RequestManager) {
        
        self.coreDataManager = coreDataManager
        self.requestManager = requestManager
    }
    
    func getImage(url: String?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {return}
                
        if let imageContainer = self.getImageContainer(url: url), let imageData = imageContainer.image {
            completion(UIImage(data: imageData as Data))
        } else {
            requestManager.getBaseRequest().execute(url: url) { [weak self] (data) in
                guard let self = self else {return}
                
                let imageContainer = ImageContainer(context: self.coreDataManager.context)
                imageContainer.imageUrl = url
                imageContainer.image = data as NSData
                self.coreDataManager.saveContext()
                
                DispatchQueue.main.async {
                    if let imageContainer = self.getImageContainer(url: url), let imageData = imageContainer.image {
                        completion(UIImage(data: imageData as Data))
                    }
                }
            }
        }
    }
    
    func getImageContainer(url: String) -> ImageContainer? {
        
        return coreDataManager.fetch(ImageContainer.self, predicate: NSPredicate(format: "imageUrl == %@", url))
    }
}

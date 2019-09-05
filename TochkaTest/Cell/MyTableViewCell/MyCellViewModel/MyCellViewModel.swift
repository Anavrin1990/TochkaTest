//
//  MyCellViewModel.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit

class MyCellViewModel: MyCellViewModelType {
    
    var title = Box<String?>("")
    var descr = Box<String?>("")
    var previewImage = Box<UIImage?>(#imageLiteral(resourceName: "defaultImage"))
    
    required init(sight: Sight, imageManager: ImageManager) {
        
        title.value = sight.text
        descr.value = sight.longDescr
        
        imageManager.getImage(url: sight.imageUrl) { [weak self] (image) in
            self?.previewImage.value = image
        }
    }
}

//
//  MyCellViewModelType.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit

protocol MyCellViewModelType {
    
    var title: Box<String?> {get}
    var descr: Box<String?> {get}
    var previewImage: Box<UIImage?> {get}
    
    init(sight: Sight, imageManager: ImageManager)
}

//
//  MainViewModelType.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation

protocol MainViewModelType {
    
    var sightsArray: Box<[Sight]> {get}
    var cellID: String {get}
    var stopPagination: Bool {get}
    
    func getMyCellViewModel(at indexPath: IndexPath) -> MyCellViewModelType
    func loadMore()
    
    init(requestManager: RequestManager, imageManager: ImageManager)    
}

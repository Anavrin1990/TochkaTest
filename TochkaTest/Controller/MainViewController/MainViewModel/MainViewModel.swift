//
//  MainViewModel.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation

class MainViewModel: MainViewModelType {
    
    var sightsArray = Box([Sight]())
    
    let requestManager: RequestManager
    let imageManager: ImageManager
    
    var cellID = "myCell"
    var stopPagination = true
    
    private var offset: Int16 = 0
    
    required init(requestManager: RequestManager, imageManager: ImageManager) {
        
        self.requestManager = requestManager
        self.imageManager = imageManager
        
        self.getSightResponse(offset: offset)
    }
    
    func loadMore() {
        
        stopPagination = true
        getSightResponse(offset: offset)
    }
    
    func getSightResponse(offset: Int16) {
        
        requestManager.getSightRequest(count: 30, offset: offset) { [weak self] sightResponse in
            guard let self = self else {return}
            
            self.sightsArray.value += sightResponse.items?.array as! [Sight]
            self.offset = sightResponse.nextOffset
            
            self.stopPagination = sightResponse.nextOffset >= sightResponse.totalCount
        }
    }
    
    func getMyCellViewModel(at indexPath: IndexPath) -> MyCellViewModelType {
        
        return MyCellViewModel(sight: sightsArray.value[indexPath.row], imageManager: imageManager)
    }
}

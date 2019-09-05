//
//  Box.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {        
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        
        self.listener = listener
        listener(value)
    }
}

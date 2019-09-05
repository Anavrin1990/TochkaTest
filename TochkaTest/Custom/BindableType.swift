//
//  BindableType.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit

protocol BindableType {
    
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension BindableType {
    
    mutating func bind(to viewModel: Self.ViewModelType) {
        
        self.viewModel = viewModel
        bindViewModel()
    }
}

extension BindableType where Self: UIViewController {
    
    mutating func bind(to model: Self.ViewModelType) {
        
        self.viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
    
}

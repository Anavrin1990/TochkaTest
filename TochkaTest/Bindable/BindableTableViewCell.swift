//
//  BindableTableViewCell.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import UIKit

class BindableTableViewCell<T>: UITableViewCell, BindableType {

    var viewModel: T!
    
    func bindViewModel() {}     

}

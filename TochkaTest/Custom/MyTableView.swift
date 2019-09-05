//
//  MyTableView.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit

class MyTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setTableView()
    }
    
    private func setTableView() {
        
        tableFooterView = UIView()
        backgroundColor = .clear
        estimatedRowHeight = 60
        estimatedSectionHeaderHeight = 0
        estimatedSectionFooterHeight = 0
        rowHeight = UITableView.automaticDimension
        sectionHeaderHeight = UITableView.automaticDimension
        sectionFooterHeight = UITableView.automaticDimension
    }    
}
